import 'dart:convert';
// import 'dart:developer';
// import 'package:real_weather_forecast/utilities/location.dart';
import 'package:http/http.dart' as http;
import 'package:real_weather_forecast/models/weather_forecast_daily.dart';
import 'package:real_weather_forecast/utilities/constants.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {required String cityName}) async {
    var queryParameters = {
      'APPID': Constants.WEATHER_APP_ID,
      'units': 'metric',
      'q': cityName,
    };

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, queryParameters);

    print('request: ${uri.toString()}');

    var response = await http.get(uri);

    print('response: ${response?.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error response');
    }
  }
}
