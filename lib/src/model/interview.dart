import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interview.g.dart';

@JsonSerializable()
class Interview extends Equatable {
  late final String id;
  late final String companyName;
  late final String companyMail;
  late final String rif;
  late final String latitude;
  late final String longitude;
  late final String industry;
  late final String status;

  Interview({
    required this.id,
    required this.companyName,
    required this.companyMail,
    required this.rif,
    required this.latitude,
    required this.longitude,
    required this.industry,
    required this.status,
  });

  factory Interview.fromJson(Map<String, dynamic> json) => _$InterviewFromJson(json);

  Map<String, dynamic> toJson() => _$InterviewToJson(this);

  @override
  List<Object> get props => [companyName];
}
