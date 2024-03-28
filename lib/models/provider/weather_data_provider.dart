import 'dart:math';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:habib_s_application5/data/weatherdata_class.dart';
import 'package:habib_s_application5/models/weathermodel.dart';

class WeatherDataProvider extends ChangeNotifier {
  WeatherData? _weatherData;

  WeatherData? get weatherData => _weatherData;

  Future<void> fetchWeatherDatas(
    double latitude,
    double longitude,
    TextEditingController airTemperatureController,
    TextEditingController windSpeedController,
    TextEditingController psychrometricConstantController,
    TextEditingController slopeOfVaporPressureCurveController,
    TextEditingController actualVaporPressureController,
    TextEditingController saturationVaporPressureController,
    TextEditingController soilHeatFluxController,
    TextEditingController meanAirTemperature,
    TextEditingController netRadiationController,
  ) async {
    try {
      _weatherData = await WeatherService.fetchWeatherData(latitude, longitude);
      notifyListeners();
      if (_weatherData != null) {
        // Update the controllers with the fetched data
        airTemperatureController.text =
            convertToDegreeCelcius(_weatherData!.main!.temp!).toString();
        windSpeedController.text = _weatherData!.wind!.speed.toString();
        psychrometricConstantController.text = '0.067';
        slopeOfVaporPressureCurveController.text =
            slopeVapourPressureCurve(_weatherData!.main!.temp!)
                .toStringAsFixed(2);
        actualVaporPressureController.text = actualVaporPressure(
                _weatherData!.main!.temp!, _weatherData!.main!.humidity!)
            .toStringAsFixed(2);
        saturationVaporPressureController.text =
            saturationVaporPressure(_weatherData!.main!.temp!)
                .toStringAsFixed(2);
        soilHeatFluxController.text = '0';
        meanAirTemperature.text = meanAirTemperatureCalculation(
                _weatherData!.main!.tempMax!, _weatherData!.main!.tempMin!)
            .toString();
        netRadiationController.text = "5";

        notifyListeners();
      }
    } catch (e) {
      print('Error fetching weather data: $e');
    }
  }

  double calculateEvapotranspiration({
    required double netRadiation,
    required double soilHeatFlux,
    required double meanAirTemperature,
    required double windSpeed,
    required double saturationVaporPressure,
    required double actualVaporPressure,
    required double psychrometricConstant,
  }) {
    // Convert temperature to Kelvin
    double T = meanAirTemperature + 273.15; // Convert Celsius to Kelvin
    double vaporPressureDeficit = saturationVaporPressure - actualVaporPressure;

    double numerator = (0.408 * saturationVaporPressure * netRadiation) +
        (psychrometricConstant * (900 / T) * vaporPressureDeficit * windSpeed);

    double denominator = saturationVaporPressure +
        (psychrometricConstant * (1 + (0.34 * windSpeed)));

    // Calculate reference evapotranspiration
    double eto = numerator / denominator;

    print("Eto: $eto mm/day");

    return eto;
  }

  double longwaveRadiation(double airTemperature) {
    return 4.903 * math.pow(10, -9) * math.pow(airTemperature + 273.15, 4);
  }

  double slopeVapourPressureCurve(double temperature) {
    double slope = 4098 *
        (0.6108 * exp((17.27 * temperature) / (temperature + 237.3))) /
        pow(temperature + 237.3, 2);
    return slope;
  }

  double actualVaporPressure(double temperature, int relativeHumidity) {
    // Convert temperature from Kelvin to Celsius
    //double temperatureCelsius = temperature - 273.15;

    // Calculate actual vapor pressure using the formula
    double vaporPressure =
        (0.6108 * exp((17.27 * temperature) / (temperature + 237.3))) *
            (relativeHumidity / 100);

    return vaporPressure;
  }

  double saturationVaporPressure(double temperature) {
    // Convert temperature to Celsius
    // double temperatureCelsius = temperature - 273.15;

    // Calculate saturation vapor pressure using the formula
    double saturationPressure =
        0.6108 * exp((17.27 * temperature) / (temperature + 237.3));

    return saturationPressure;
  }

  double meanAirTemperatureCalculation(
      double airTemperatureMax, double airTemperatureMin) {
    // Convert temperatures from Kelvin to Celsius
    // double airTemperatureMaxCelsius = airTemperatureMax - 273.15;
    // double airTemperatureMinCelsius = airTemperatureMin - 273.15;

    // Calculate the mean air temperature
    double meanTemperature = (airTemperatureMax + airTemperatureMin) / 2;

    return meanTemperature;
  }

  // Other calculation methods...

  double convertToDegreeCelcius(double kelvin) {
    return kelvin - 273.15;
  }
}
