// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weatherapi/model/weather_model.dart';

class Service {
  Future<Weather?> getCurrentWeather(String? location) async {
    try {
      var url = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=3837f082b65893f0fc5883912ebd9ac8&units=metric");

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        return Weather.fromJson(body);
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Exception: $e");
      return null;
    }
  }
}
