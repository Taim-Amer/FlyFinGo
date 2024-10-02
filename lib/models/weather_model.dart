class WeatherModel{

  String? cityName;
  String? condition;
  // String? weatherIcon;
  double? weatherTemp;
  String? country ;


  WeatherModel.fromJson(Map <String , dynamic> json) {
    cityName = json["location"]["name"];
    condition = json["current"]["condition"]["text"];
    // weatherIcon = json["current"]["condition"]["icon"];
    weatherTemp = json["current"]["temp_c"];
    country = json["location"]["country"];
  }
}