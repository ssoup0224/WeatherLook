import 'package:flutter/material.dart';
import 'package:weather_look/gender.dart';
import 'package:weather_look/login.dart';
import 'package:weather_look/signup.dart';
import 'package:weather_look/style.dart';
import 'package:weather_look/tts.dart';

class WeatherLook extends StatelessWidget {
  const WeatherLook({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Look',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const LoginPage(),
        '/signup': (BuildContext context) => const SignUpPage(),
        '/gender': (BuildContext context) => const GenderSelectPage(),
        '/style': (BuildContext context) => const StyleSelectPage(),
        '/tts': (BuildContext context) => TextToSpeech(),
      },
    );
  }
}
