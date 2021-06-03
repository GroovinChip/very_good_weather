import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_weather/api/models/location.dart';

void main() {
  File? file;
  Location? location;

  setUp(() async {
    file = File('test/data/consolidated_weather.json');
    // Read json and make sure models can be made from it
    try {
      final json = jsonDecode(await file!.readAsString());
      location = Location.fromJson(json);
    } catch (e) {
      print(e);
    }
  });

  test('Location title', () {
    expect(location!.title, 'London');
  });

  test('Location place type', () {
    expect(location!.location_type, 'City');
  });
}
