import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_movil/jobOffers/bloc/jobOfferEvents.dart';
import 'package:gigandjob_movil/jobOffers/bloc/jobOfferStatus.dart';
import 'package:gigandjob_movil/jobOffers/repository/jobOfferRepository.dart';
import 'package:gigandjob_movil/postulation/bloc/PostulationBloc.dart';
import 'package:gigandjob_movil/postulation/bloc/PostulationState.dart';

class JobOfferBloc extends Bloc<JobOfferEvent, JobOfferState> {

  final JobOfferRepository repository;
  final PostulationBloc bloc;
  JobOfferBloc(this.bloc, {required this.repository}) : super(InitialJobOffers()){
    on<JobOfferLoaded>(_jobOffersLoaded);
  }

  Future<void> _jobOffersLoaded(JobOfferLoaded event, Emitter<JobOfferState> emitter) async {
   
    try {
      emitter(LoadingJobOffers());
      final jobOffers = await repository.headline();
      emitter(JobOffersComplete(jobOffers));
      bloc.emit(PostulationInitialState());
    }
    catch (e) {
      print(e);
      // emitter(JobOfferError('Uknoewk akl error'));
    }
  }


}