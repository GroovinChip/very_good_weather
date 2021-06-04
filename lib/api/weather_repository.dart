import 'dart:async';

import 'package:very_good_weather/api/meta_weather.dart';
import 'package:very_good_weather/api/models/weather.dart';

/// A central repository for handling weather API functions
class WeatherRepository {
  WeatherRepository({
    required this.weatherApiClient,
  });

  final MetaWeather weatherApiClient;

  /// Gets the weather for the specified city.
  ///
  /// Finds the location ID and fetches the weather based on that ID.
  Future<Weather> getWeather(String city) async {
    final int locationId = await weatherApiClient.getLocationId(city);
    return weatherApiClient.fetchWeather(locationId);
  }
}
