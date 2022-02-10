import 'package:equatable/equatable.dart';

class JobOffer extends Equatable {
  String id;
  String description;
  String title;
  String vacants;
  String startDate;
  String finalDate;
  String status;
  List<dynamic> skills;
  String vacant;

  JobOffer({
    required this.id,
    required this.description,
    required this.title,
    required this.vacants, 
    required this.startDate,
    required this.finalDate,
    required this.status,
    required this.skills,
    required this.vacant,
  });
  
  factory JobOffer.fromJson(Map<String, dynamic> json) {
    final skillsg = [];
    json["skills"].forEach((skills) => skillsg.add(skills));
    return JobOffer(
    id: json['id'] ,
    description: json['description'],
    title: json['title'],
    vacants: json['vacants'],
    startDate: json['starDate'],
    finalDate: json['finalDate'],
    skills: skillsg,
    status: json['status'],
    vacant: json['vacant'],
  );
  }

  Map<String, dynamic> toJson() {
    var map = {
      'id': id,
      'description': description,
      'title': title,
      'vacants': vacants,
      'starDate': startDate,
      'finalDate': finalDate,
      'skills': skills,
      'status': status, 
      'vacant': vacant,
    };

    return map;
  }

   @override
    List<Object> get props => [
      id,
      description, 
      title, 
      vacants,
      startDate,
      finalDate,
      skills,
      status,
      vacant
    ];



}