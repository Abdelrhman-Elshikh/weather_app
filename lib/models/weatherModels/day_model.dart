
class DayModel {
  final double maxTemp;
  final double minTemp;
  final double temp;

  const DayModel({
    required this.maxTemp,
    required this.minTemp,
    required this.temp,
  });

  factory DayModel.fromJson(jsonData) {
    return DayModel(
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['maxtemp_c'],
      temp: jsonData['avgtemp_c'],
    );
  }
}
