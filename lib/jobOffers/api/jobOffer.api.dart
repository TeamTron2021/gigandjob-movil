import 'dart:convert';

import 'package:gigandjob_movil/auth/auth_model/auth_model.dart';
import 'package:gigandjob_movil/jobOffers/api/jobOfferResponse.api.dart';
import 'package:gigandjob_movil/jobOffers/model/jobOffer.model.dart';
import 'package:http/http.dart' as http;

class JobOfferApiProvider {
  static const _url = 'gigandjob-backend.herokuapp.com';

  final http.Client _httpClient;

  JobOfferApiProvider({http.Client? httpClient }) : _httpClient = httpClient ?? http.Client();

  Future<List<dynamic>> headline() async {
    final result = await _callGetApi();
    return result;
  }

  Future<List<dynamic>> _callGetApi() async {
    var uri = Uri.http(_url, '/job-offer');

    final response = await http.get(uri);
    print(jsonDecode(response.body)['message']);
    return jsonDecode(response.body)['message'];

    
    
  }

}