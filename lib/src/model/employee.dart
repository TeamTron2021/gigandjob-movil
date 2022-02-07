import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable()
class Employee extends Equatable {
  late final String id;
  late final String companyName;
  late final String companyMail;
  late final String rif;
  late final String latitude;
  late final String longitude;
  late final String industry;
  late final String status;

  Employee({
    required this.id,
    required this.companyName,
    required this.companyMail,
    required this.rif,
    required this.latitude,
    required this.longitude,
    required this.industry,
    required this.status,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);

  @override
  List<Object> get props => [companyName];
}
