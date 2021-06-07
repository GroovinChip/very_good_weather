import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_weather/state/blocs/settings_bloc.dart';
import 'package:very_good_weather/state/settings_event.dart';
import 'package:very_good_weather/state/events/settings_state.dart';
import 'package:very_good_weather/ui/widgets/adaptive_app_bar.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdaptiveAppBar(
        titleText: 'Settings',
      ),
      body: ListView(
        children: <Widget>[
          BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
            return ListTile(
              title: Text(
                'Temperature Units',
              ),
              isThreeLine: true,
              subtitle: Text('Use metric measurements for temperature units.'),
              trailing: Switch.adaptive(
                activeColor: Theme.of(context).accentColor,
                value: state.temperatureUnits == TemperatureUnits.celsius,
                onChanged: (_) => BlocProvider.of<SettingsBloc>(context).add(
                  TemperatureUnitsToggled(),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
