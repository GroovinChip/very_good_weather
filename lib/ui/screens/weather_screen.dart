import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_weather/state/blocs/theme_bloc.dart';
import 'package:very_good_weather/state/blocs/weather_bloc.dart';
import 'package:very_good_weather/state/weather_state.dart';
import 'package:very_good_weather/state/events/weather_event.dart';
import 'package:very_good_weather/state/events/theme_event.dart';
import 'package:very_good_weather/state/theme_state.dart';
import 'package:very_good_weather/ui/screens/city_selection.dart';
import 'package:very_good_weather/ui/screens/settings_screen.dart';
import 'package:very_good_weather/ui/widgets/combined_weather_temperature.dart';
import 'package:very_good_weather/ui/widgets/gradient_container.dart';
import 'package:very_good_weather/ui/widgets/last_updated.dart';
import 'package:very_good_weather/ui/widgets/location.dart';

class Weather extends StatefulWidget {
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  late Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Very Good Weather'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Settings(),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {
            if (state is WeatherLoadSuccess) {
              BlocProvider.of<ThemeBloc>(context).add(
                WeatherChanged(condition: state.weather.condition!),
              );
              _refreshCompleter.complete();
              _refreshCompleter = Completer();
            }
          },
          builder: (context, state) {
            if (state is WeatherInitial) {
              return Center(
                child: Text(
                  'Please Select a Location',
                  style: Theme.of(context).textTheme.headline6,
                ),
              );
            }
            if (state is WeatherLoadInProgress) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is WeatherLoadSuccess) {
              final weather = state.weather;

              return BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, themeState) {
                  return GradientContainer(
                    color: themeState.color,
                    child: RefreshIndicator(
                      onRefresh: () {
                        BlocProvider.of<WeatherBloc>(context).add(
                          WeatherRefreshRequested(city: weather.location!),
                        );
                        return _refreshCompleter.future;
                      },
                      child: ListView(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 100.0),
                            child: Center(
                              child: Location(location: weather.location!),
                            ),
                          ),
                          Center(
                            child: LastUpdated(dateTime: weather.lastUpdated!),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 50.0),
                            child: Center(
                              child: CombinedWeatherTemperature(
                                weather: weather,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            if (state is WeatherLoadFailure) {
              return Text(
                'Something went wrong!',
                style: TextStyle(color: Colors.red),
              );
            }

            throw Exception('Uh oh');
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () async {
          final city = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CitySelection(),
            ),
          );
          if (city != null) {
            BlocProvider.of<WeatherBloc>(context)
                .add(WeatherRequested(city: city));
          }
        },
        label: Text('Search'),
        icon: Icon(Icons.search),
      ),
    );
  }
}
