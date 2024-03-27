import 'package:dio/dio.dart';
import 'package:habib_s_application5/models/weathermodel.dart';

class WeatherService {
  static Future<WeatherData> fetchWeatherData(double latitude, double longitude) async {
    final String apiKey = 'cd462317d9f2dc3393c7036655f0cec1';
    final String units = "metric";
    final String apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=$units&appid=$apiKey';

    try {
      Response response = await Dio().get(apiUrl);
      if (response.statusCode == 200) {
        return WeatherData.fromJson(response.data);
      } else {
        throw Exception('Failed to load weather data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load weather data: $e');
    }
  }
}
