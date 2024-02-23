import 'package:dio/dio.dart';
import 'package:habib_s_application5/models/weathermodel.dart';

Future<WeatherData> fetchWeatherData(String cityName) async {
  final String apiKey = 'cd462317d9f2dc3393c7036655f0cec1'; // Replace 'YOUR_API_KEY' with your actual API key
  final String apiUrl =
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey';

  try {
    Response response = await Dio().get(apiUrl);
    print('Response from API: ${response.data}');
    if (response.statusCode == 200) {
      return WeatherData.fromJson(response.data);
    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to load weather data: $e');
  }
}
