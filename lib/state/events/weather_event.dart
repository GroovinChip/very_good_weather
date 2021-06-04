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
  const WeatherRefreshRequested({
    required this.city,
  });

  final String city;

  @override
  List<Object> get props => [city];
}
