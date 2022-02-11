import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gigandjob_movil/interviews/api/Interview.api.dart';
import 'package:gigandjob_movil/interviews/api/Interview.repository.dart';
import 'package:gigandjob_movil/interviews/bloc/interviewState.dart';
import 'package:gigandjob_movil/interviews/models/interview.model.dart';

import 'InterviewEvent.dart';

class InterviewBloc extends Bloc<InterviewEvent, InterviewState> {
  final InterviewRepository interviewRepository;

  InterviewBloc({required this.interviewRepository}) : super(InitialInterviews()){
    on<InterviewLoaded>(_interviewsLoaded);
  }

  Future<void> _interviewsLoaded(
    InterviewLoaded event,
    Emitter<InterviewState> emitter
  ) async {
    emitter(LoadingInterviews());
    final interviews= await interviewRepository.headline();
    emitter(InterviewsComplete(interviews));
  }
}