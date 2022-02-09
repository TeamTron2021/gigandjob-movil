// GENERATED CODE - DO NOT MODIFY BY HAND


// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


part of 'postulation.dart';

Postulation _$PostulationFromJson(Map<String, dynamic> json) => Postulation(
      id: json['id'] as String,
      date: json['date'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$PostulationToJson(Postulation instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'status': instance.status,
    };
