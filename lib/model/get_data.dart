import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wheather_app_bloc/model/weather.dart';

class GetData {
  String BASE_URL = "https://www.metaweather.com";
  final http.Client httpClient = http.Client();

  Future<int> getCityId(String cityName) async {
    debugPrint(cityName);
    String cityUrl =
        "https://www.metaweather.com/api/location/search/?query=$cityName";
    var response = await http.get(cityUrl);
    if (response.statusCode != 200) {
      debugPrint("data cant bring");
    }
    var jsonO = jsonDecode(response.body) as List;
    return jsonO[0]["woeid"];
  }

  Future<Weather> getData(int CityId) async {
    String url = "https://www.metaweather.com/api/location/$CityId";
    var response = await httpClient.get(url);
    if (response.statusCode != 200) {
      debugPrint("data cant come");
    }
    var json = jsonDecode(response.body);
    return Weather.fromJson(json);
  }
  Future<String>getImage(int cityID){
    String url = "https://www.metaweather.com/api/location/$cityID/";
  }
}
