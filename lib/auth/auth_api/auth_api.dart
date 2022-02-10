import 'dart:convert';

import 'package:gigandjob_movil/auth/auth_model/auth_model.dart';
import 'package:http/http.dart' as http;

class AuthenticationApiProvider {
  static const String _baseUrl = 'gigandjob-backend.herokuapp.com';

  final http.Client _httpClient;

  AuthenticationApiProvider({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  Future<Authentication> headline(String email, String password) async{
    final result = await _callGetApi(email, password);
    return result;
  }

  Future<Authentication> _callGetApi(String email, String password) async {
    var uri = Uri.http(_baseUrl, "/auth/user");

    final response = await _httpClient.post(
      uri,
      body: {
        "email": email,
        "password": password
      });
    print(response.body);
    final result = Authentication.fromJson(jsonDecode(response.body));
    return result;
  }
}