import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:very_good_weather/api/models/weather.dart';

/// Defines a Dart interface for the MetaWeather API
class MetaWeather {
  MetaWeather({
    required this.httpClient,
  });

  final http.Client httpClient;

  static const baseUrl = 'https://www.metaweather.com';

  Future<int> getLocationId(String city) async {
    final locationUrl = '$baseUrl/api/location/search/?query=$city';
    final locationResponse = await this.httpClient.get(Uri.parse(locationUrl));
    if (locationResponse.statusCode != 200) {
      throw Exception('error getting locationId for city');
    }

    final locationJson = jsonDecode(locationResponse.body) as List;
    return (locationJson.first)['woeid'];
  }

  Future<Weather> fetchWeather(int locationId) async {
    final weatherUrl = '$baseUrl/api/location/$locationId';
    final weatherResponse = await this.httpClient.get(Uri.parse(weatherUrl));

    if (weatherResponse.statusCode != 200) {
      throw Exception('error getting weather for location');
    }

    final weatherJson = jsonDecode(weatherResponse.body);
    return Weather.fromJson(weatherJson);
  }
}
