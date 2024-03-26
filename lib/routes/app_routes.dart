import 'package:flutter/material.dart';
import 'package:habib_s_application5/presentation/manual_calculation_screen/geolocatorpage.dart';
import 'package:habib_s_application5/presentation/onboarding_screen/onboarding_screen.dart';
import 'package:habib_s_application5/presentation/manual_calculation_screen/manual_calculation_screen.dart';
import 'package:habib_s_application5/presentation/evapotranspiration_automatic_calculation_screen/evapotranspiration_automatic_calculation_screen.dart';
import 'package:habib_s_application5/presentation/history_screen/history_screen.dart';
import 'package:habib_s_application5/presentation/history_details_screen/history_details_screen.dart';
import 'package:habib_s_application5/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String onboardingScreen = '/onboarding_screen';

  static const String manualCalculationScreen = '/manual_calculation_screen';

  static const String evapotranspirationAutomaticCalculationScreen =
      '/evapotranspiration_automatic_calculation_screen';

  static const String historyScreen = '/history_screen';

  static const String historyDetailsScreen = '/history_details_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String getapplocationScreen = '/getapplocation_screen';

  static Map<String, WidgetBuilder> routes = {
    onboardingScreen: (context) => OnboardingScreen(),
    manualCalculationScreen: (context) => ManualCalculationScreen(),
    evapotranspirationAutomaticCalculationScreen: (context) =>
        EvapotranspirationAutomaticCalculationScreen(),
    historyScreen: (context) => HistoryScreen(),
    historyDetailsScreen: (context) => HistoryDetailsScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    getapplocationScreen:(context) =>   AskForLocationPage(),
  };
}
