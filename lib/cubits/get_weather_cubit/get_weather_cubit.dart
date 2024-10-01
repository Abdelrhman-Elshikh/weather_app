import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/models/weatherModels/weather_model.dart';
import 'package:weather_app/service/get_weather_service.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit() : super(NoWeatherState());

  WeatherModel? weatherModel;

  getWeather(String cityName, int daysNumber) async {
    try {
      WeatherModel responseWeatherModel = await GetWeatherService()
          .getWeather(location: cityName, days: daysNumber);

      weatherModel = responseWeatherModel;
      emit(WeatherLoadedState(weather: weatherModel!));
    } catch (e) {
      emit(WeatherFailureState());
      // log(e.toString());
    }
  }
}
