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
    List collection = [];
    var uri = Uri.http(_interviewUrl, '/postulation/280f4e9e-21bc-4665-b95f-432b3c7aca12');

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      collection = convert.jsonDecode(response.body);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    return collection;
  }
}