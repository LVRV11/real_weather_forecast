import 'package:flutter/material.dart';
// import 'package:real_weather_forecast/screens/location_screen.dart';

import 'screens/weather_forecast_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WeatherForecastScreen(),
    );
  }
}
