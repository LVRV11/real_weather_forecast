import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:real_weather_forecast/api/weather_api.dart';
import 'package:real_weather_forecast/screens/weather_forecast_screen.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  void getLocationData() async {
    try {
      BuildContext currentContext = context; // Сохраняем context
      var weatherInfo = await WeatherApi().fetchWeatherForecast(
        city: 'London', // Укажите название города здесь
        isCity: true, // Укажите значение для isCity
      );
      // ignore: use_build_context_synchronously
      Navigator.push(currentContext, MaterialPageRoute(builder: (context) {
        return WeatherForecastScreen(locationWeather: weatherInfo);
      }));
    } catch (e) {
      print('$e');
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(color: Colors.black87, size: 100.0),
      ),
    );
  }
}
