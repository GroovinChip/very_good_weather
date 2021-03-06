import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:very_good_weather/api/meta_weather.dart';
import 'package:very_good_weather/api/weather_repository.dart';
import 'package:very_good_weather/app.dart';
import 'package:very_good_weather/state/bloc_observer.dart';
import 'package:very_good_weather/state/blocs/settings_bloc.dart';
import 'package:very_good_weather/state/blocs/theme_bloc.dart';

// Entry point
void main() {
  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: MetaWeather(
      httpClient: http.Client(),
    ),
  );

  // Set up bloc observer so events can be observed
  Bloc.observer = SimpleBlocObserver();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider<SettingsBloc>(
          create: (context) => SettingsBloc(),
        ),
      ],
      child: App(
        weatherRepository: weatherRepository,
      ),
    ),
  );
}
