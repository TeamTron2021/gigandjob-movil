import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interview.g.dart';

@JsonSerializable()
class Interview extends Equatable {
  late final String id;
  late final String title;
  late final String description;
  late final String date;
  late final String status;

  Interview({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.status,
  });

  factory Interview.fromJson(Map<String, dynamic> json) => _$InterviewFromJson(json);

  Map<String, dynamic> toJson() => _$InterviewToJson(this);

  @override
  List<Object> get props => [title];
}
