import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_movil/postulation/bloc/PostulationEvent.dart';
import 'package:gigandjob_movil/postulation/bloc/PostulationState.dart';

class PostulationBloc extends Bloc<PostulationEvent, PostulationState> {
  PostulationBloc() : super(PostulationInitialState()){
    on<PostulationSended>(_postulationSended);
  }

  Future<void> _postulationSended(PostulationSended event, Emitter<PostulationState> emmit) async {
    try {
      emmit(PostulationSending());

      emmit(PostulationSendSuccess());
      emmit(PostulationInitialState());
    } catch (e) {
      print(e);
      emmit(PostulationFailed(error:  e.toString()));
    }
  }


}