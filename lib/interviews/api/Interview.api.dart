import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:gigandjob_movil/constants.dart' as global;

import '../models/interview.model.dart';

class InterviewApiProvider {
  static const _interviewUrl = global.baseUrl + '/interview/';
  final http.Client _httpClient;

  InterviewApiProvider({http.Client? httpClient}) : _httpClient = httpClient ?? http.Client();

  Future<List<dynamic>> headline() async {
    return await _getInterviewsByPostulation();
  }

  static Future<List<dynamic>> _getInterviewsByPostulation() async {
    List collection;
    List<Interview> _interviews = [];
    var uri = Uri.http(_interviewUrl, '/postulation/3fa85f64-5717-4562-b3fc-2c963f66afa6');

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      collection = convert.jsonDecode(response.body);
      _interviews = collection.map((json) => Interview.fromJson(json)).toList();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return _interviews;
  }
}