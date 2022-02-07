import 'dart:convert';

import 'package:flutter_bloc_architecture/src/data_provider/response/api_response_employee.dart';
import 'package:flutter_bloc_architecture/src/model/employee.dart';
import 'package:http/http.dart' as http;


/// Esta excepción sera lanzada cuando la REST API regrese el error.code: 'apiKeyMissing'
class MissingApiKeyException implements Exception {}

/// Esta excepción sera lanzada cuando la REST API regrese el error.code: 'apiKeyInvalid'
class ApiKeyInvalidException implements Exception {}

class EmployeeNewsProvider {
  /// Reemplaza esta API key por tu propia llave
  static const String _apiKey = 'fe050c83e88a4c9d93e6bff7842a1da1';

  /// Este es la URL de la REST API. Mas informacion en: https://newsapi.org/docs/endpoints/top-headlines
  static const String _baseUrl = '10.0.2.2:3000';
  static const String _topHeadlines = '/v2/top-headlines';

  /// Dado que mas adelante vamos a crear un Mock de este objeto es necesario
  /// iniciarlizarlo por medio del constructor
  final http.Client _httpClient;

  EmployeeNewsProvider({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  /// Esta funcion sera llamada desde el Repositorio
  Future<List<Employee>> topHeadlines() async {
    final result = await _callGetApi();
    return result.message!;
  }

  Future<EmployeeApiResponse> _callGetApi() async {
    var uri = Uri.http(_baseUrl, "/employeer");

    final response = await _httpClient.get(uri);
    print(response.body);
    final result =  EmployeeApiResponse.fromJson((json.decode(response.body)));


    /// Si no hay ningun error, regresamos el resultado de la REST API
    return result;
  }
}
