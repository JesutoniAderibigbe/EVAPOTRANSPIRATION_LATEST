import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:habib_s_application5/models/weathermodel.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherData? _weatherData;

  WeatherData? get weatherData => _weatherData;

  Future<void> fetchWeatherData(double latitude, double longitude) async {
    final String apiKey =
        'cd462317d9f2dc3393c7036655f0cec1'; // Replace 'YOUR_API_KEY' with your actual API key
    final String units = "metric"; // or "imperial"
    final String apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=$units&appid=$apiKey';

    try {
      Response response = await Dio().get(apiUrl);
      if (response.statusCode == 200) {
        _weatherData = WeatherData.fromJson(response.data);
        notifyListeners(); // Notify listeners about the new weather data
      } else {
        throw Exception('Failed to load weather data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load weather data: $e');
    }
  }
}
