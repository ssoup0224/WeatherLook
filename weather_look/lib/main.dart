import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weather_look/app.dart';
import 'package:weather_look/firebase_options.dart';

Future<void> main() async {
  //KakaoSdk.init(nativeAppKey: '66f8ad7afa5171a7d8923c9e6f94e6e1');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const WeatherLook());
}
