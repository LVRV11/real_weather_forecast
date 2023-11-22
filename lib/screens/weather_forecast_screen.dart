import 'package:flutter/material.dart';
import 'package:real_weather_forecast/api/weather_api.dart';
import 'package:real_weather_forecast/models/weather_forecast_daily.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({super.key});

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  String _cityName = 'London';

  @override
  void initState() {
    super.initState();
    forecastObject = WeatherApi().fetchWeatherForecast(cityName: _cityName);

    forecastObject.then((weather) {
      print(weather.list[0].weather[0].main);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // ... (остальной код)
          ),
      body: ListView(
        children: <Widget>[
          Container(
            child: FutureBuilder<WeatherForecast>(
              future: forecastObject,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Показываем индикатор ожидания во время загрузки данных
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  // Если произошла ошибка, отобразим ее
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  // Если данные загружены успешно, отобразим "All Good"
                  return Text('All Good',
                      style: Theme.of(context).textTheme.headline1);
                } else {
                  return const Text(
                      'No Data'); // Может потребоваться другое сообщение
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
