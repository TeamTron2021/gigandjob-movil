// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interview_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


InterviewApiResponse _$InterviewApiResponseFromJson(Map<String, dynamic> json) => InterviewApiResponse()
  ..message =  (json['message'] as List<dynamic>?)
      ?.map((e) => Interview.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$InterviewApiResponseToJson(InterviewApiResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
