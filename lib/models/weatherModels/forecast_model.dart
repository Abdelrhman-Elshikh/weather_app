
import 'package:weather_app/models/weatherModels/day_model.dart';

class ForecastModel {
  final String date;
  final DayModel day;

  const ForecastModel({
    required this.date,
    required this.day,
  });

  factory ForecastModel.fromJson(jsonData) {
    return ForecastModel(
        date: jsonData['date'],
        day: DayModel.fromJson(jsonData['day']));
  }
}
