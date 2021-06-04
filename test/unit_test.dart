import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_weather/api/models/models.dart';
import 'package:very_good_weather/state/blocs/settings_bloc.dart';
import 'package:very_good_weather/state/blocs/theme_bloc.dart';
import 'package:very_good_weather/state/events/settings_state.dart';
import 'package:very_good_weather/state/weather_state.dart';

void main() {
  File? file;
  Weather? weather;

  setUp(() async {
    file = File('test/data/consolidated_weather.json');
    // Read json and make sure models can be made from it
    try {
      final json = jsonDecode(await file!.readAsString());
      weather = Weather.fromJson(json);
    } catch (e) {
      print(e);
    }
  });

  test('Location title', () {
    expect(weather!.location, 'London');
  });

  group('SettingsBloc', () {
    late SettingsBloc settingsBloc;

    setUp(() {
      settingsBloc = SettingsBloc();
    });

    test('Initial state', () {
      expect(settingsBloc.state.temperatureUnits, TemperatureUnits.celsius);
    });
  });

  group('ThemeBloc', () {
    late ThemeBloc themeBloc;

    setUp(() {
      themeBloc = ThemeBloc();
    });

    test('Initial state', () {
      expect(themeBloc.state.theme, ThemeData.light());
      expect(themeBloc.state.color, Colors.lightBlue);
    });
  });
}
