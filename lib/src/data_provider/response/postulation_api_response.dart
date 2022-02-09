
import 'package:flutter_bloc_architecture/src/model/postulation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'postulation_api_response.g.dart';

@JsonSerializable()
class PostulationApiResponse {
  late final List<Postulation>? message;

  PostulationApiResponse();

  factory PostulationApiResponse.fromJson(Map<String, dynamic> json) => _$PostulationApiResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostulationApiResponseToJson(this);
}
