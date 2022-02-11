import 'package:equatable/equatable.dart';

class Interview extends Equatable {
  String id;
  String title;
  String description;
  DateTime date;
  String postulationId;
  String status;

  Interview({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.postulationId,
    required this.status,
  });

  factory Interview.fromJson(Map<String, dynamic> json) {
    return Interview(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      date: json['date'],
      postulationId: json['postulationId'],
      status: json['status'],
    );
  }

  @override
  List<Object> get props => [
    id,
    title,
    description,
    date,
    postulationId,
    status,
  ];
}