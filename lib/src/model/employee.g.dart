// GENERATED CODE - DO NOT MODIFY BY HAND


// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


part of 'employee.dart';

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      id: json['id'] as String,
      companyName: json['companyName'] as String,
      companyMail: json['companyMail'] as String,
      rif: json['rif'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      industry: json['longitude'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'companyName': instance.companyName,
      'companyMail': instance.companyMail,
      'rif': instance.rif,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'industry': instance.industry,
      'status': instance.status,
    };
