import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_movil/interviews/api/Interview.api.dart';
import 'package:gigandjob_movil/interviews/api/Interview.repository.dart';
import 'package:gigandjob_movil/interviews/bloc/InterviewBloc.dart';
import 'package:gigandjob_movil/interviews/bloc/InterviewEvent.dart';
import 'package:gigandjob_movil/jobOffers/bloc/jobOfferStatus.dart';
import 'package:gigandjob_movil/jobOffers/model/jobOffer.model.dart';

import '../bloc/interviewState.dart';
import '../models/interview.model.dart';

class InterviewView extends StatelessWidget {
  InterviewView({Key? key}): super(key: key);

  @override
  Widget create(BuildContext context) {
    final provider = InterviewApiProvider();
    final repository = InterviewRepository(provider);
    return BlocProvider(create: (context) => InterviewBloc(interviewRepository: repository),
    child: InterviewView(),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Interviews'),
      ),
      body: BlocBuilder<InterviewBloc, InterviewState>(
          builder: (context, state) {
            if (state is InterviewsComplete) {
              return ListView.builder(
                itemCount: state.interviews.length,
                itemBuilder: (context, int index)
                  => _ListItemInterviews(interview: state.interviews[index])
              );
            } else if (state is InterviewError) {
              return Text(state.error);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

class _ListItemInterviews extends StatelessWidget {
  final Interview interview;

  const _ListItemInterviews({
    Key? key,
    required Interview this.interview,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  color: Colors.amber[50],
                  width: 80,
                  height: 80,
                ),
                Expanded(child:  Column(
                  children: [
                    Text(
                      interview.title,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 3,),
                    Text(interview.description,
                      style: TextStyle(fontSize: 10),
                      overflow: TextOverflow.ellipsis,),
                    SizedBox(height: 5,),
                    SizedBox(height: 5,),
                    Text('${interview.date}',
                      style: TextStyle(fontSize: 10),
                      overflow: TextOverflow.ellipsis,),
                    Text(interview.status,
                      style: TextStyle(fontSize: 10),
                      overflow: TextOverflow.ellipsis,),
                    // PostulationButtom()
                  ],
                ),)

              ],
            ),
            //Aqui va el boton para postularse
          ],
        ),),
    );
  }}

