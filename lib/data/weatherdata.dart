import 'package:dio/dio.dart';
import 'package:habib_s_application5/models/weathermodel.dart';

Future<WeatherData> fetchWeatherData(double latitude, double longitude) async {
  final String apiKey =
      'cd462317d9f2dc3393c7036655f0cec1'; // Replace 'YOUR_API_KEY' with your actual API key
      final String units = "metric"; // or "imperial"
  final String apiUrl =
      'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&units=$units&appid=$apiKey';

  try {
    Response response = await Dio().get(apiUrl);
  //  print('Response from API: ${response.data}');
    print('Response status: ${response.statusCode}');
    if (response.statusCode == 200) {
      print('Weather data loaded successfully');
      WeatherData weatherData = WeatherData.fromJson(response.data);
     // print('Parsed weather data: $weatherData');
     //print("${weatherData.lat}");
      return weatherData;
      //  return WeatherData.fromJson(response.data);
    } else {
      throw Exception('Failed to load weather data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to load weather data: $e');
  }
}
