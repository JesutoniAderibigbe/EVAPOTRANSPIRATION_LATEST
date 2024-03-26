import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'package:habib_s_application5/services/location/location.dart';
import 'core/app_export.dart';
import 'firebase_options.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  //add firebase
  await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
  );

 //GeoLocatorService().getLocation1(context!);
 

  // await GeoLocatorService().getCurrentLocation();




  // await GeoLocatorService().isLocationEnabled();

  ///Please update theme as per your need if required.
  ThemeHelper().changeTheme('primary');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
 //    GeoLocatorService().getLocation1(context);
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          theme: theme,
          title: 'habib_s_application5',
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.onboardingScreen,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
