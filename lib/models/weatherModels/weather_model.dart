import 'package:weather_app/models/weatherModels/Location_model.dart';
import 'package:weather_app/models/weatherModels/forecast_model.dart';
import 'package:weather_app/models/weatherModels/current_data_model.dart';

class WeatherModel {
  final LocationModel location;
  final CurrentDataModel currentData;
  final List<ForecastModel> forecast;

  const WeatherModel({
    required this.location,
    required this.currentData,
    required this.forecast,
  });

  factory WeatherModel.fromJson(jsonData) {
    List<ForecastModel> forecastDays = [];
    for (var forecastday in jsonData['forecast']['forecastday']) {
      forecastDays.add(ForecastModel.fromJson(forecastday));
    }
    return WeatherModel(
        location: LocationModel.fromJson(jsonData['location']),
        currentData: CurrentDataModel.fromJson(jsonData['current']),
        forecast: forecastDays);
  }
}
