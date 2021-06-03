import 'package:equatable/equatable.dart';
import 'package:very_good_weather/api/weather_conditions.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class WeatherChanged extends ThemeEvent {
  final WeatherCondition condition;

  const WeatherChanged({required this.condition});

  @override
  List<Object> get props => [condition];
}
