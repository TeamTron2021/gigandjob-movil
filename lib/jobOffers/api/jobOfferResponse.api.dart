import 'package:gigandjob_movil/jobOffers/model/jobOffer.model.dart';

class JobOfferApiResponse {

  late final List<JobOffer>? message;

  JobOfferApiResponse();

  factory JobOfferApiResponse.fromJson(Map<String, dynamic> json) => JobOfferApiResponse()
  ..message =  (json['message'] as List<dynamic>?)
      ?.map((e) => JobOffer.fromJson(e as Map<String, dynamic>))
      .toList();

      
  Map<String, dynamic> toJson() => _$JobOfferApiResponseToJson(this);


  JobOfferApiResponse _$JobOfferApiResponseFromJson(Map<String, dynamic> json) => JobOfferApiResponse()
  ..message =  (json['message'] as List<dynamic>?)
      ?.map((e) => JobOffer.fromJson(e as Map<String, dynamic>))
      .toList();

    Map<String, dynamic> _$JobOfferApiResponseToJson(JobOfferApiResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

}

