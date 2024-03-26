import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:habib_s_application5/core/app_export.dart';
import 'package:habib_s_application5/presentation/manual_calculation_screen/manual_calculation_screen.dart';
import 'package:habib_s_application5/services/location/location.dart';
import 'package:habib_s_application5/theme/theme_helper.dart';

class AskForLocationPage extends StatefulWidget {
  const AskForLocationPage({Key? key}) : super(key: key);

  @override
  State<AskForLocationPage> createState() => _AskForLocationPageState();
}

class _AskForLocationPageState extends State<AskForLocationPage> {
  late Position _currentPosition;
  final LocationService geoLocatorService = LocationService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      //  appBar: AppBar(),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
             

              try {
                //    await geoLocatorService.determinePosition();

                bool isLocationServiceEnabled =
                    await Geolocator.isLocationServiceEnabled();
                print("Location Service Enabled: $isLocationServiceEnabled");

                LocationPermission permission =
                    await Geolocator.checkPermission();
                print("Location Permission: $permission");

                // Get current position
                Position _currentPosition =
                    await Geolocator.getCurrentPosition();
                print("Position: $_currentPosition");

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog.adaptive(
                      title: Text(
                          "Your exact location has the laitutide ${_currentPosition.latitude} and longitude ${_currentPosition.longitude}",
                          style: theme.textTheme.labelSmall),
                      content: Text(
                          "Do you wish to continue to view other details from your location?"),
                      actions: [
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) =>
                                          ManualCalculationScreen(latitude: _currentPosition.latitude, longitude: _currentPosition.longitude,)));
                            },
                            child: Text(
                              "Yes",
                              style: theme.textTheme.labelSmall,
                            )),
                        SizedBox(width: 31.v),
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child:
                                Text("No", style: theme.textTheme.labelSmall))
                      ],
                    );

                   
                  },
                );

                // Do something with _currentPosition here
              } catch (e) {
                print("Error getting location: $e");
              }
            },
            child: Text('Get Location'),
          ),
        ),
      ),
    );
  }
}
