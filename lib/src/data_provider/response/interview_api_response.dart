
import 'package:flutter_bloc_architecture/src/model/interview.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interview_api_response.g.dart';

@JsonSerializable()
class InterviewApiResponse {
  late final List<Interview>? message;

  InterviewApiResponse();

  factory InterviewApiResponse.fromJson(Map<String, dynamic> json) => _$InterviewApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InterviewApiResponseToJson(this);
}
