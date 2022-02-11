import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_movil/jobOffers/api/jobOffer.api.dart';
import 'package:gigandjob_movil/jobOffers/bloc/jobOfferBloc.dart';
import 'package:gigandjob_movil/jobOffers/bloc/jobOfferEvents.dart';
import 'package:gigandjob_movil/jobOffers/bloc/jobOfferStatus.dart';
import 'package:gigandjob_movil/jobOffers/repository/jobOfferRepository.dart';
import 'package:gigandjob_movil/postulation/bloc/PostulationBloc.dart';
import 'package:gigandjob_movil/postulation/postulationButton.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'model/jobOffer.model.dart';

class JobOfferView extends StatelessWidget {
  JobOfferView({Key? key}) : super(key: key);
  
  @override
  Widget create(BuildContext context) {
    final provider = JobOfferApiProvider();
    final repository = JobOfferRepository(provider);
    final bloc = PostulationBloc();
    return BlocProvider(create:  (context) => JobOfferBloc(bloc, repository: repository),
    child: JobOfferView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JobOffer'),
      ),
      body: BlocBuilder<JobOfferBloc, JobOfferState>(
        builder: (context, state) {
          if (state is JobOffersComplete) {
            return ListView.builder(
              itemCount: state.jobOffer.length,
              itemBuilder: (context, int index)
                => _ListItemJobOffer(jobOffer: state.jobOffer[index])
            );
          } else if (state is JobOfferError) {
            return Text(state.error);
          }
          else {
             return Center(
              child: CircularProgressIndicator()
              );
          }
        },
      )
    );

  }
}

class _ListItemJobOffer extends StatelessWidget {
  final JobOffer jobOffer;

  const _ListItemJobOffer({
    Key? key,
    required this.jobOffer,
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
                        '${jobOffer.title}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 3,),
                        Text('${jobOffer.description}',
                      style: TextStyle(fontSize: 10),
                      overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 5,),
                      // ElevatedButton(onPressed: () {}, 
                      // child: Text('Apply'),
                      // )
                      PostulationButtom()
                    ],
                  ),)
                  
                ],
              ),
              //Aqui va el boton para postularse
            ],
          ),),
          
      );
  }
}
