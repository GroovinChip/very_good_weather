import 'package:equatable/equatable.dart';

enum TemperatureUnits {
  fahrenheit,
  celsius,
}

class SettingsState extends Equatable {
  const SettingsState({
    required this.temperatureUnits,
  });

  final TemperatureUnits temperatureUnits;

  @override
  List<Object> get props => [temperatureUnits];
}
