import 'package:flutter/material.dart';

import 'login.dart';

class WeatherLook extends StatelessWidget {
  const WeatherLook({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Look',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const LoginPage(),
      },
    );
  }
}
