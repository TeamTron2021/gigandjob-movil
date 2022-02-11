import 'package:equatable/equatable.dart';

abstract class JobOfferEvent extends Equatable {
  const JobOfferEvent();
  @override
  List<Object> get props => [];

}

class JobOfferInitialEvent extends JobOfferEvent {}

class JobOfferLoaded extends JobOfferEvent {}