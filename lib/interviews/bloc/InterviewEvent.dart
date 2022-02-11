import 'package:gigandjob_movil/interviews/models/interview.model.dart';

abstract class InterviewEvent {}

class AcceptInterviewEvent extends InterviewEvent {
  late final Interview interview;

  acceptInterviewEvent(interview) {}
}

class LoadInterviewsEvent extends InterviewEvent {}