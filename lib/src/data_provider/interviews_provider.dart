import 'dart:convert';

import 'package:flutter_bloc_architecture/src/data_provider/response/interview_api_response.dart';
import 'package:flutter_bloc_architecture/src/model/interview.dart';
import 'package:http/http.dart' as http;

class MissingApiKeyException implements Exception {}

class ApiKeyInvalidException implements Exception {}

class InterviewsProvider {
 
  static const String _baseUrl = '10.0.2.2:3000';
  static const String _topHeadlines = '/interview/postulation/e09fc7bc-7c3c-47f0-8e72-0c60311df142';

  final http.Client _httpClient;

  InterviewsProvider({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();


  Future<List<Interview>> topHeadlines() async {
    final result = await _callGetApi();
    return result.message!;
  }

  Future<InterviewApiResponse> _callGetApi() async {
    var uri = Uri.http(_baseUrl, _topHeadlines);

    final response = await _httpClient.get(uri);
    print(response.body);
    final result =  InterviewApiResponse.fromJson((json.decode(response.body)));

    return result;
  }
}
