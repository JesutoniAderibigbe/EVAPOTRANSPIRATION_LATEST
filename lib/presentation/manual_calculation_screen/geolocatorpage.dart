import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:habib_s_application5/core/app_export.dart';
import 'package:habib_s_application5/models/provider/location_provider.dart';
import 'package:habib_s_application5/presentation/manual_calculation_screen/manual_calculation_screen.dart';
import 'package:habib_s_application5/services/location/location.dart';
import 'package:provider/provider.dart';

class AskForLocationPage extends StatefulWidget {
  const AskForLocationPage({Key? key}) : super(key: key);

  @override
  State<AskForLocationPage> createState() => _AskForLocationPageState();
}

class _AskForLocationPageState extends State<AskForLocationPage> {
  final LocationService geoLocatorService = LocationService();

  @override
  Widget build(BuildContext context) {
    var locationProvider = Provider.of<LocationProvider>(context);
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              try {
                Center(child: CircularProgressIndicator.adaptive());
                Position _currentPosition =
                    await Geolocator.getCurrentPosition();
                print(_currentPosition.latitude);
                locationProvider.updateLocation(
                    _currentPosition.latitude, _currentPosition.longitude);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                        "Your exact location has the latitude ${_currentPosition.latitude} and longitude ${_currentPosition.longitude}",
                        style: theme.textTheme.bodySmall,
                      ),
                      content: Text(
                          "Do you wish to continue to view other details from your location?"),
                      actions: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ManualCalculationScreen()));
                          },
                          child: Text("Yes"),
                        ),
                        SizedBox(width: 31.v),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text("No"),
                        )
                      ],
                    );
                  },
                );
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
