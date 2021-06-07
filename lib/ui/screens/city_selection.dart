import 'dart:io';

import 'package:flutter/material.dart';
import 'package:very_good_weather/ui/widgets/adaptive_app_bar.dart';
import 'package:very_good_weather/ui/widgets/adaptive_city_icon.dart';

class CitySelection extends StatefulWidget {
  @override
  State<CitySelection> createState() => _CitySelectionState();
}

class _CitySelectionState extends State<CitySelection> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveAppBar(
        titleText: 'Search',
      ),
      body: Form(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
              child: TextFormField(
                controller: _textController,
                decoration: InputDecoration(
                  prefixIcon: AdaptiveCityIcon(),
                  labelText: 'City',
                  hintText: 'Chicago',
                ),
              ),
            ),
            if (Platform.isMacOS) ...[
              const SizedBox(height: 8.0),
            ],
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    Navigator.pop(context, _textController.text);
                  },
                  child: Text('SEARCH'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
