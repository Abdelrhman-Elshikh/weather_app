import 'package:weather_app/models/weatherModels/weather_model.dart';

class GetWeatherState {}

class NoWeatherState extends GetWeatherState {}

class WeatherLoadedState extends GetWeatherState {
  final WeatherModel weather;
  WeatherLoadedState({
    required this.weather,
  });
}

class WeatherFailureState extends GetWeatherState {}
