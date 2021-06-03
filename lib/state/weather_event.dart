import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherRequested extends WeatherEvent {
  const WeatherRequested({
    required this.city,
  });

  final String city;

  @override
  List<Object> get props => [city];
}

class WeatherRefreshRequested extends WeatherEvent {
  final String city;

  const WeatherRefreshRequested({required this.city});

  @override
  List<Object> get props => [city];
}
