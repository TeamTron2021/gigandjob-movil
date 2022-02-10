import 'package:equatable/equatable.dart';

abstract class PostulationState extends Equatable {
  PostulationState();

  @override
  List<Object> get props => [];
}

class PostulationInitialState extends PostulationState {}

class PostulationSending extends PostulationState {}

class PostulationSendSuccess extends PostulationState {}

class PostulationFailed extends PostulationState {
  String error;

  PostulationFailed({required this.error});

   @override
  List<Object> get props => [error];
}