import 'package:weather_app/models/weatherModels/condition_model.dart';

class CurrentDataModel {
  final String tempC;
  final ConditionModel condition;
  final String windSpeed;
  final String humidity;
  final String lastUpdated;

  const CurrentDataModel(
      {required this.condition,
      required this.humidity,
      required this.tempC,
      required this.windSpeed,
      required this.lastUpdated});

  factory CurrentDataModel.fromJson(jsonData) {
    return CurrentDataModel(
      condition: ConditionModel.formJson(
        jsonData['condition'],
      ),
      humidity: jsonData['humidity'].toString(),
      tempC: jsonData['temp_c'].toString(),
      windSpeed: jsonData['wind_kph'].toString(),
      lastUpdated: jsonData['last_updated'],
    );
  }
}
