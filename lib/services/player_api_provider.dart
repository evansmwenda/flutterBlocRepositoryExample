import 'dart:convert';

import 'package:football_bloc/models/api_models.dart';
import 'package:http/http.dart' as http;

class PlayerApiProvider {

  String baseUrl = "https://www.easports.com/fifa/ultimate-team/api/fut/item?";
  final successCode = 200;

  Future<List<Players>> fetchPlayersByCountry(String countryId) async {
    String url = baseUrl + "country=" + countryId;
    final response = await http.get(Uri.parse(url));

    return parseResponse(response);
  }

  Future<List<Players>> fetchPlayersByName(String name) async {
    String url = baseUrl+"name="+name;
    final response = await http.get(Uri.parse(url));

    return parseResponse(response);
  }

  List<Players> parseResponse(http.Response response) {
    final responseString = jsonDecode(response.body);

    if (response.statusCode == successCode) {
      return ApiModels.fromJson(responseString).items;
    } else {
      throw Exception('failed to load players');
    }
  }
}