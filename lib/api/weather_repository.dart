import 'dart:async';

import 'package:very_good_weather/api/meta_weather.dart';
import 'package:very_good_weather/api/models/weather.dart';

class WeatherRepository {
  WeatherRepository({
    required this.weatherApiClient,
  });

  final MetaWeather weatherApiClient;

  Future<Weather> getWeather(String city) async {
    final int locationId = await weatherApiClient.getLocationId(city);
    return weatherApiClient.fetchWeather(locationId);
  }
}
