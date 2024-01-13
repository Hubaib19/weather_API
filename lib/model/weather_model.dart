class Weather {
  String? cityName;
  double? temp;
  double? temp_min;
  int? sunrise;
  int? sunset;
  double? temp_max;
  Weather(
      {this.cityName,
      this.temp,
      this.temp_min,
      this.sunrise,
      this.sunset,
      this.temp_max});

  Weather.fromJson(Map<String, dynamic> json) {
    cityName = json['name'];
    temp = json["main"]["temp"];
    temp_min = json["main"]["temp_min"];
    temp_max = json["main"]["temp_max"];
    sunrise = json["sys"]["sunrise"];
    sunset = json["sys"]["sunset"];
  }
}
