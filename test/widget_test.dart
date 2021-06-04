// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_weather/api/models/weather.dart';
import 'package:very_good_weather/api/weather_conditions.dart';
import 'package:very_good_weather/ui/widgets/combined_weather_temperature.dart';
import 'package:very_good_weather/ui/widgets/gradient_container.dart';
import 'package:very_good_weather/ui/widgets/last_updated.dart';
import 'package:very_good_weather/ui/widgets/location.dart';
import 'package:very_good_weather/ui/widgets/weather_conditions.dart';

void main() {
  group('Widgets', () {
    testWidgets('Tests Location() widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Location(
              location: 'Baltimore',
            ),
          ),
        ),
      );
      expect(find.text('Baltimore'), findsOneWidget);
    });

    testWidgets('Tests LastUpdated() widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LastUpdated(
              key: Key('last_updated'),
              dateTime: DateTime.now(),
            ),
          ),
        ),
      );
      expect(find.byKey(Key('last_updated')), findsOneWidget);
    });

    testWidgets('Tests GradientContainer() widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: GradientContainer(
              color: Colors.red,
              child: Text('Hello!'),
            ),
          ),
        ),
      );
      expect(find.text('Hello!'), findsOneWidget);
    });

    testWidgets('Tests WeatherConditions() widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: WeatherConditions(
              key: Key('combined_weather_temperature'),
              condition: WeatherCondition.clear,
            ),
          ),
        ),
      );
      expect(find.byKey(Key('combined_weather_temperature')), findsOneWidget);
    });
  });
}
