import 'package:freezed_annotation/freezed_annotation.dart';

part 'consolidated_weather.freezed.dart';
part 'consolidated_weather.g.dart';

@freezed
class ConsolidatedWeather with _$ConsolidatedWeather {
  const factory ConsolidatedWeather({
    int? id,
    String? applicable_date,
    String? weather_state_name,
    String? weather_state_abbr,
    double? wind_speed,
    double? wind_direction,
    String? wind_direction_compass,
    double? min_temp,
    double? max_temp,
    double? the_temp,
    double? air_pressure,
    double? humidity,
    double? visibility,
    int? predictability,
  }) = _ConsolidatedWeather;

  factory ConsolidatedWeather.fromJson(Map<String, dynamic> json) =>
      _$ConsolidatedWeatherFromJson(json);
}
