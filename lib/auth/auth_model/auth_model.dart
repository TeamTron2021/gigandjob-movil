import 'package:equatable/equatable.dart';

class Authentication extends Equatable {
  String id; 
  String access_token;

  Authentication ({required this.id, required this.access_token});

  factory Authentication.fromJson(Map<String, dynamic> json) => Authentication(
    id: json['id'] ?? '',
    access_token: json['access_token'] ?? '',
  );

  Map<String, dynamic> toJson() {
    var map = {
      'id': id,
      'access_token': access_token
    };

    return map;
  }

  @override
  List<Object> get props => [id, access_token];
}