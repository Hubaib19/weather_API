class Weather {
  String? cityName;
  double? temp;
  double? temp_min;
  int? humidity;
  double? wind;
  double? temp_max;
  Weather(
      {this.cityName,
      this.temp,
      this.temp_min,
      this.humidity,
      this.wind,
      this.temp_max});

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['name'];
    temp = json["main"]["temp"];
    temp_min = json["main"]["temp_min"];
    temp_max = json["main"]["temp_max"];
    humidity = json["main"]["humidity"];
    wind = json["wind"]["speed"];
  }
}
