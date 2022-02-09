import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'postulation.g.dart';

@JsonSerializable()
class Postulation extends Equatable {
  late final String id;
  late final String date;
  late final String status;

  Postulation({
    required this.id,
    required this.date,
    required this.status,
  });

  factory Postulation.fromJson(Map<String, dynamic> json) => _$PostulationFromJson(json);

  Map<String, dynamic> toJson() => _$PostulationToJson(this);

  @override
  List<Object> get props => [date];
}
