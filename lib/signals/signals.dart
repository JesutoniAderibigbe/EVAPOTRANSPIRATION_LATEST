import 'package:habib_s_application5/models/weathermodel.dart';
import 'package:signals/signals.dart';


  WeatherData? weatherData;

  
final netRadiationSignal = signal(0.0);
final soilHeatFluxSignal = signal(0.0);
final meanAirTemperatureSignal = signal(0.0);
final windSpeedSignal = signal(0.0);
final saturationVaporPressureSignal = signal(0.0);
final actualVaporPressureSignal = signal(0.0);
final slopeOfVaporPressureCurveSignal = signal(0.0);
final psychrometricConstantSignal = signal(0.067); // Default value
final evapotranspirationSignal = signal(0.0); // Initially 0
// Initially 0



