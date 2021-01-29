import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:http/http.dart' as http;
import 'package:wayha_covid_dash/models/covid_model.dart';

class CovidStatProvider {
  // url link for API
  static const CUR_URL = 'https://covid-19-alpha9.herokuapp.com/covid';

  static Future<Covid> getCovidStat() async {
    var response = await http.get(CUR_URL);
    final Map parsed = json.decode(response.body);
    final covidData = Covid.fromJson(parsed);

    return covidData;
  }
}
