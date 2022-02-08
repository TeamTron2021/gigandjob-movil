// GENERATED CODE - DO NOT MODIFY BY HAND


// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


part of 'interview.dart';

Interview _$InterviewFromJson(Map<String, dynamic> json) => Interview(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$InterviewToJson(Interview instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'date': instance.date,
      'status': instance.status,
    };
