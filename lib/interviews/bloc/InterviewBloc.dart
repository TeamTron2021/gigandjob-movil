import 'dart:async';

import 'package:gigandjob_movil/interviews/bloc/interviewState.dart';
import 'package:gigandjob_movil/interviews/models/interview.model.dart';

import 'InterviewEvent.dart';

class InterviewBloc {
  InterviewState _interviewState = InterviewState();

  StreamController<InterviewEvent> _input = StreamController();
  StreamController<List<Interview>> _output = StreamController<List<Interview>>.broadcast();

  // Para que las vistas puedan enviar y escuchar eventos.
  StreamSink<InterviewEvent> get sendEvent => _input.sink;
  Stream<List<Interview>> get interviewStream => _output.stream;

  InterviewBloc() {
    _input.stream.listen(_onEvent); // Escucha de eventos.
  }

  // Procesa los eventos
  void _onEvent(InterviewEvent event) {
    if (event is AcceptInterviewEvent) {
      _interviewState.acceptInterview(event.interview);
    }

    // enviar el nuevo valor
    _output.add(_interviewState.interview);
 }

  // Libera los recursos de los StreamController.
  void dispose() {
    _input.close();
    _output.close();
  }
}