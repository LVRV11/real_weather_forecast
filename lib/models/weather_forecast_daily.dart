class WeatherData {
  String cod;
  int message;
  City city;
  int cnt;
  List<WeatherItem> list;

  WeatherData({
    required this.cod,
    required this.message,
    required this.city,
    required this.cnt,
    required this.list,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      cod: json['cod'],
      message: json['message'],
      city: City.fromJson(json['city']),
      cnt: json['cnt'],
      list: List<WeatherItem>.from(
        json['list'].map((item) => WeatherItem.fromJson(item)),
      ),
    );
  }
}

class City {
  int geonameId;
  String name;
  double lat;
  double lon;
  String country;
  String iso2;
  String type;
  int population;

  City({
    required this.geonameId,
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    required this.iso2,
    required this.type,
    required this.population,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      geonameId: json['geoname_id'],
      name: json['name'],
      lat: json['lat'].toDouble(),
      lon: json['lon'].toDouble(),
      country: json['country'],
      iso2: json['iso2'],
      type: json['type'],
      population: json['population'],
    );
  }
}

class WeatherItem {
  int dt;
  Temperature temp;
  double pressure;
  int humidity;
  List<WeatherDescription> weather;
  double speed;
  int deg;
  double gust;
  int clouds;
  double snow;

  WeatherItem({
    required this.dt,
    required this.temp,
    required this.pressure,
    required this.humidity,
    required this.weather,
    required this.speed,
    required this.deg,
    required this.gust,
    required this.clouds,
    required this.snow,
  });

  factory WeatherItem.fromJson(Map<String, dynamic> json) {
    return WeatherItem(
      dt: json['dt'],
      temp: Temperature.fromJson(json['temp']),
      pressure: json['pressure'].toDouble(),
      humidity: json['humidity'],
      weather: List<WeatherDescription>.from(
        json['weather'].map((item) => WeatherDescription.fromJson(item)),
      ),
      speed: json['speed'].toDouble(),
      deg: json['deg'],
      gust: json['gust'].toDouble(),
      clouds: json['clouds'],
      snow: json['snow'].toDouble(),
    );
  }
}

class Temperature {
  double day;
  double min;
  double max;
  double night;
  double eve;
  double morn;

  Temperature({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(
      day: json['day'].toDouble(),
      min: json['min'].toDouble(),
      max: json['max'].toDouble(),
      night: json['night'].toDouble(),
      eve: json['eve'].toDouble(),
      morn: json['morn'].toDouble(),
    );
  }
}

class WeatherDescription {
  int id;
  String main;
  String description;
  String icon;

  WeatherDescription({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherDescription.fromJson(Map<String, dynamic> json) {
    return WeatherDescription(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}
