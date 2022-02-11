import 'package:equatable/equatable.dart';
import 'package:gigandjob_movil/interviews/models/interview.model.dart';

abstract class InterviewEvent extends Equatable {
  const InterviewEvent();

  @override
  List<Object> get props => [];
}

class InterviewInitialEvent extends InterviewEvent {}

class InterviewLoaded extends InterviewEvent {}

class AcceptedInterviewEvent extends InterviewEvent {
  late final Interview interview;

  acceptInterviewEvent(interview) {}
}

class GetInterviewsEvent extends InterviewEvent {}