// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBlEgQaq3PMaLBi_mSqsDoP5Ax6eTNbcCg',
    appId: '1:482374606772:android:752e426360fd88f2f7dce1',
    messagingSenderId: '482374606772',
    projectId: 'alusoft-app',
    databaseURL: 'https://alusoft-app-default-rtdb.firebaseio.com',
    storageBucket: 'alusoft-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDhbt8OquPcmhc07ckwLOHAYFdsz2CSxxs',
    appId: '1:482374606772:ios:df8ae76dce98ea46f7dce1',
    messagingSenderId: '482374606772',
    projectId: 'alusoft-app',
    databaseURL: 'https://alusoft-app-default-rtdb.firebaseio.com',
    storageBucket: 'alusoft-app.appspot.com',
    androidClientId: '482374606772-h4km2dl5nqc5nr5uh9f6l5qo78hchvad.apps.googleusercontent.com',
    iosClientId: '482374606772-o6hj0osnsc2sccr9gl7v8sslq2qchrtg.apps.googleusercontent.com',
    iosBundleId: 'com.habibsapplication.app.testProject',
  );
}
