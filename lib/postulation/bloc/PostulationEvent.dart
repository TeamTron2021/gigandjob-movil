import 'package:equatable/equatable.dart';

abstract class PostulationEvent extends Equatable {
  const PostulationEvent();

  @override
  List<Object> get props => [];
}

class PostulationSended extends PostulationEvent {}

class PostulationInitialEvent extends PostulationEvent {}

