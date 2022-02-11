import 'package:equatable/equatable.dart';
import 'package:gigandjob_movil/interviews/models/interview.model.dart';

class InterviewState extends Equatable {
  const InterviewState();

  @override
  List<Object> get props => [];
}

class LoadingInterviews extends InterviewState {}

class InitialInterviews extends InterviewState {}

class InterviewsWithoutAccepting extends InterviewState {
  final List<Interview> interviews;

  const InterviewsWithoutAccepting(this.interviews);

  @override
  List<Object> get props => [interviews];
}

class InterviewsComplete extends InterviewState {
  final List<Interview> interviews;

  const InterviewsComplete(this.interviews);

  @override
  List<Object> get props => [interviews];
}

class InterviewError extends InterviewState {
  final String error;

  InterviewError(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'InterviewError: { error: $error }';
}