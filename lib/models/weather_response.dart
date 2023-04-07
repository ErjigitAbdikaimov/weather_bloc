import 'dart:convert';

import 'package:weather_bloc/models/main_model.dart';

import 'weather.dart';

class WeatherResponse {
  final List<Weather> weather;
  final Main main;
  final String name;

  WeatherResponse({
    required this.weather,
    required this.main,
    required this.name,
  });

  factory WeatherResponse.fromMap(Map<String, dynamic> map) {
    return WeatherResponse(
      weather: List<Weather>.from(
        (map['weather'] as List<dynamic>).map<Weather>(
          (x) => Weather.fromJson(x as Map<String, dynamic>),
        ),
      ),
      main: Main.fromJson(map['main'] as Map<String, dynamic>),
      name: map['name'] as String,
    );
  }

  factory WeatherResponse.fromJson(String source) =>
      WeatherResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
