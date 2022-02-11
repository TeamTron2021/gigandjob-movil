import 'package:equatable/equatable.dart';
import 'package:gigandjob_movil/jobOffers/model/jobOffer.model.dart';

abstract class JobOfferState extends Equatable {
  const JobOfferState();

  @override
  List<Object> get props => [];
}

class LoadingJobOffers extends JobOfferState {}

class InitialJobOffers extends JobOfferState {}

class JobOffersComplete extends JobOfferState {
  final List<JobOffer> jobOffer;

  const JobOffersComplete(this.jobOffer);

  @override
  List<Object> get props => [jobOffer];
}

class JobOfferError extends JobOfferState {
  final String error;

  JobOfferError(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => ' JobOfferError { error: $error }';
}