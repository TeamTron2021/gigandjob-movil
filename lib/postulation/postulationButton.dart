import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_movil/postulation/bloc/PostulationBloc.dart';
import 'package:gigandjob_movil/postulation/bloc/PostulationEvent.dart';
import 'package:gigandjob_movil/postulation/bloc/PostulationState.dart';

class PostulationButtom extends StatelessWidget {
  const PostulationButtom({Key? key}) : super(key: key);

  @override
  Widget create(BuildContext context) {
    // final provider = PostulationApiProvider;
    // final repository = PostulationRepository;

    return BlocProvider(create: (context) => PostulationBloc(),
    child: PostulationButtom(),
    );

    
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostulationBloc, PostulationState>(
        builder: (context, state) {
          if(state is PostulationFailed) {
            Text(state.error);
          }
          
          return  ElevatedButton(
              child: Text('Apply'),
              style: ElevatedButton.styleFrom(
                
              ), 
              onPressed: () { 
                BlocProvider.of<PostulationBloc>(context).add(PostulationSended());
               },
              );
        }
      );
    
  }
}