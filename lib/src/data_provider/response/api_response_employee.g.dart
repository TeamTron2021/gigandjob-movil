// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


EmployeeApiResponse _$EmployeeApiResponseFromJson(Map<String, dynamic> json) => EmployeeApiResponse()
  ..message =  (json['message'] as List<dynamic>?)
      ?.map((e) => Employee.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$EmployeeApiResponseToJson(EmployeeApiResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
    };
