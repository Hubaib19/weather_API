import 'package:flutter/material.dart';
import 'package:weatherapi/services/weather_api.dart';
import '../model/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
  Weather? data;

  WeatherProvider(){
    getData('kerala');
  }

  Future<Weather?> getData(String place) async {
    isLoading = true;
    notifyListeners();

    data = await Service().getCurrentWeather(place);

    isLoading = false;
    notifyListeners();

    return data;
  }

}
