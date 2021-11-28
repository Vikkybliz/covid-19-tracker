import 'package:new_app/coronaApi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<CoronaApi> getCoronaApi() async {
  final url = Uri.parse('https://corona.lmao.ninja/v3/covid-19/all');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return CoronaApi.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to get Data from Api');
  }
}
