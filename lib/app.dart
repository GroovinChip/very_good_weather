import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:very_good_weather/api/weather_repository.dart';
import 'package:very_good_weather/state/blocs/theme_bloc.dart';
import 'package:very_good_weather/state/blocs/weather_bloc.dart';
import 'package:very_good_weather/state/theme_state.dart';
import 'package:very_good_weather/ui/screens/weather_screen.dart';
import 'package:very_good_weather/ui/themes.dart';

class App extends StatelessWidget {
  App({
    Key? key,
    required this.weatherRepository,
  }) : super(key: key);

  final WeatherRepository weatherRepository;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        return MaterialApp(
          title: 'Very Good Weather',
          //theme: themeState.theme,
          theme: Themes.lightTheme,
          darkTheme: Themes.darkTheme,
          themeMode: ThemeMode.system,
          home: BlocProvider(
            create: (context) => WeatherBloc(
              weatherRepository: weatherRepository,
            ),
            child: Weather(),
          ),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
