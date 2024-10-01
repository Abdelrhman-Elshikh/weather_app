import 'package:weather_app/helper/api.dart';
import 'package:weather_app/models/weatherModels/weather_model.dart';

class GetWeatherService {
  final String key = '44b4e7054ae4414cadc134016242809';
  final String baseURL = 'https://api.weatherapi.com/v1';


  Future<WeatherModel> getWeather(
      {required String location, required int days}) async {
    //receive Response,
    Map<String, dynamic> data = await Api().get(
        url:
            '$baseURL/forecast.json?key=$key&q=$location&days=${days.toString()}',
        token: null);
//
    return WeatherModel.fromJson(data);
  }
}