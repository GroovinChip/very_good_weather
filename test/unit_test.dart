import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_weather/api/models/models.dart';

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
}
