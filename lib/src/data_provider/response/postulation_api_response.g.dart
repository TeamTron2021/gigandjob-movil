// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'postulation_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


PostulationApiResponse _$PostulationApiResponseFromJson(Map<String, dynamic> json) => PostulationApiResponse()
  ..message =  (json['message'] as List<dynamic>?)
      ?.map((e) => Postulation.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$PostulationApiResponseToJson(PostulationApiResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
