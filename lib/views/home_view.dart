import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_state.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  final MaterialColor bgColor;
  const HomeView({Key? key, required this.bgColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const SearchView();
                }));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, GetWeatherState>(
          builder: (context, state) => Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                bgColor,
                bgColor.withOpacity(0.6),
                bgColor.withOpacity(0.3)
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Builder(builder: (context) {
                if (state is NoWeatherState) {
                  return const NoWeatherBody();
                } else if (state is WeatherLoadedState) {
                  return WeatherInfoBody();
                } else {
                  return const Center(
                      child: Text(
                    'Opss an error occurred',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ));
                }
              }))),
    );
  }
}
