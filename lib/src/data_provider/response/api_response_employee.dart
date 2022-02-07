
import 'package:flutter_bloc_architecture/src/model/employee.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_response_employee.g.dart';

@JsonSerializable()
class EmployeeApiResponse {
  late final List<Employee>? message;

  EmployeeApiResponse();

  factory EmployeeApiResponse.fromJson(Map<String, dynamic> json) => _$EmployeeApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeApiResponseToJson(this);
}
