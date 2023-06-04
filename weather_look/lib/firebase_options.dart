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
    apiKey: 'AIzaSyADCnjMWwDNu3_8-bRid-347WJiSI7Kvpk',
    appId: '1:414170479907:android:f681e8ccfc2de5256ce096',
    messagingSenderId: '414170479907',
    projectId: 'weather-look-dd8f4',
    databaseURL: 'https://weather-look-dd8f4-default-rtdb.firebaseio.com',
    storageBucket: 'weather-look-dd8f4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAguk3V-HjHhjVfIHyJrjHGmyJcidS4SkQ',
    appId: '1:414170479907:ios:a033dae98d6baf7b6ce096',
    messagingSenderId: '414170479907',
    projectId: 'weather-look-dd8f4',
    databaseURL: 'https://weather-look-dd8f4-default-rtdb.firebaseio.com',
    storageBucket: 'weather-look-dd8f4.appspot.com',
    androidClientId: '414170479907-o2abojesbviqk2gkpg80kkilitaiik87.apps.googleusercontent.com',
    iosClientId: '414170479907-dgqa6hlbel3mqu04v2hvq77cpajm834e.apps.googleusercontent.com',
    iosBundleId: 'com.example.weatherLook',
  );
}
