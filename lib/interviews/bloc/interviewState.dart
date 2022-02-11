import 'package:gigandjob_movil/interviews/models/interview.model.dart';

class InterviewState {
  List<Interview> _interviews = [];
  String _interviewId = '';

  InterviewState._();

  static InterviewState _instance = InterviewState._();

  // Para crear una instancia compartida
  // y que solo pueda ser instanciada una vez.
  factory InterviewState() => _instance;

  List<Interview> get interview => _interviews;

  void acceptInterview(Interview interview) {
    _interviewId = interview.id;
  }
}