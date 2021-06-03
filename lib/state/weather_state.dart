import 'package:equatable/equatable.dart';
import 'package:very_good_weather/api/models/weather.dart';

enum WeatherStatus { initial, loading, success, failure }

extension WeatherStatusX on WeatherStatus {
  bool get isInitial => this == WeatherStatus.initial;
  bool get isLoading => this == WeatherStatus.loading;
  bool get isSuccess => this == WeatherStatus.success;
  bool get isFailure => this == WeatherStatus.failure;
}

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoadInProgress extends WeatherState {}

class WeatherLoadSuccess extends WeatherState {
  const WeatherLoadSuccess({
    required this.weather,
  });

  final Weather weather;

  @override
  List<Object> get props => [weather];
}

class WeatherLoadFailure extends WeatherState {}
