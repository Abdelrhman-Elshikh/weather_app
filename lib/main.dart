import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, GetWeatherState>(
          builder: (context, state) {
            MaterialColor color = getThemeColor(
              BlocProvider.of<GetWeatherCubit>(context)
                  .weatherModel
                  ?.currentData
                  .condition
                  .text,
            );

            return MaterialApp(
              theme: ThemeData(
                // primarySwatch: Colors.blue,
                primarySwatch: color,
              ),
              home: HomeView(
                bgColor: color,
              ),
            );
          },
        ),
      ),
    );
  }
}


MaterialColor getThemeColor(String? condition) {
  switch (condition) {
    case 'Sunny':
      return Colors.amber;
    case 'Clear':
      return Colors.blue;
    case 'Partly cloudy':
    case 'Cloudy':
      return Colors.grey;
    case 'Overcast':
      return Colors.blueGrey;
    case 'Mist':
    case 'Patchy rain possible':
    case 'Light rain':
    case 'Moderate rain':
    case 'Heavy rain':
      return Colors.lightBlue;
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.purple;
    case 'Snow':
    case 'Light snow':
    case 'Moderate snow':
    case 'Heavy snow':
      return Colors.lightBlue;
    case 'Fog':
    case 'Blizzard':
    case 'Blowing snow':
      return Colors.teal;
    // Add more cases based on the image conditions
    default:
      return Colors.lime;
  }
}
