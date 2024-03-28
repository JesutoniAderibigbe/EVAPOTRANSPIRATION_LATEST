import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habib_s_application5/core/utils/size_utils.dart';
import 'package:habib_s_application5/models/provider/location_provider.dart';
import 'package:habib_s_application5/models/provider/weather_data_provider.dart';
import 'package:habib_s_application5/presentation/manual_calculation_screen/geolocatorpage.dart';
import 'package:habib_s_application5/presentation/manual_calculation_screen/manual_calculation_screen.dart';

import 'package:provider/provider.dart';

void main() {
  testWidgets('Manual Calculation Screen Widget Test',
      (WidgetTester tester) async {
    // Manually call SizeUtils.setScreenSize() before pumping the widget
    SizeUtils.setScreenSize(
      BoxConstraints(maxWidth: 400, maxHeight: 800), // Example constraints
      Orientation.portrait, // Example orientation
    );

    await tester.runAsync(() async {
  await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<LocationProvider>(
            create: (context) => LocationProvider(),
          ),
          ChangeNotifierProvider<WeatherDataProvider>(
            create: (context) => WeatherDataProvider(),
          ),
        ],
        child: MaterialApp(
          home: ManualCalculationScreen(),
        ),
      ),
    );

    });

   
    // Your test code remains the same...
  });
}
