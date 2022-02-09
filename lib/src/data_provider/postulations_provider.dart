import 'dart:convert';

import 'package:flutter_bloc_architecture/src/data_provider/response/postulation_api_response.dart';
import 'package:flutter_bloc_architecture/src/model/postulation.dart';
import 'package:http/http.dart' as http;

class MissingApiKeyException implements Exception {}

class ApiKeyInvalidException implements Exception {}

class PostulationsProvider {
 
  static const String _baseUrl = '10.0.2.2:3000';
  static const String _topHeadlines = '/postulation';

  final http.Client _httpClient;

  PostulationsProvider({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();


  Future<List<Postulation>> topHeadlines() async {
    final result = await _callGetApi();
    return result.message!;
  }

  Future<PostulationApiResponse> _callGetApi() async {
    var uri = Uri.http(_baseUrl, _topHeadlines);

    final response = await _httpClient.get(uri);
    print(response.body);
    final result =  PostulationApiResponse.fromJson((json.decode(response.body)));

    return result;
  }
}
