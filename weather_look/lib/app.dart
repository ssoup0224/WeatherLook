import 'package:flutter/material.dart';
import 'package:weather_look/screens/gender.dart';
import 'package:weather_look/screens/login.dart';
import 'package:weather_look/screens/signup.dart';
import 'package:weather_look/screens/style.dart';
import 'package:weather_look/screens/tts.dart';
import 'package:weather_look/screens/weather.dart';

class WeatherLook extends StatelessWidget {
  const WeatherLook({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Look',
      initialRoute: '/tts',
      routes: {
        '/': (BuildContext context) => const LoginPage(),
        '/signup': (BuildContext context) => const SignUpPage(),
        '/gender': (BuildContext context) => const GenderSelectPage(),
        '/style': (BuildContext context) => const StyleSelectPage(),
        '/tts': (BuildContext context) => const TextToSpeech(),
        '/weather': (BuildContext context) => const WeatherPage(),
      },
    );
  }
}
