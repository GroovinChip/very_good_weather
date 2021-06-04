import 'package:equatable/equatable.dart';
import 'package:very_good_weather/api/weather_conditions.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class WeatherChanged extends ThemeEvent {
  const WeatherChanged({
    required this.condition,
  });

  final WeatherCondition condition;

  @override
  List<Object> get props => [condition];
}
