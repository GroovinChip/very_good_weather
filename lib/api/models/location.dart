import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:very_good_weather/api/models/consolidated_weather.dart';
import 'package:very_good_weather/api/models/parent.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
class Location with _$Location {
  const factory Location({
    String? title,
    String? location_type,
    String? latt_long,
    String? time,
    String? sun_rise,
    String? sun_set,
    String? timezone_name,
    List<ConsolidatedWeather>? consolidated_weather,
    Parent? parent,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
