import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                  onSubmitted: (value) async {
                    var weatherCubitProvider =
                        BlocProvider.of<GetWeatherCubit>(context);

                    weatherCubitProvider.getWeather(value, 1);
                    Navigator.pop(context);
                  },
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                    labelText: 'Search',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 25),
                    hintText: 'Enter city name',
                    suffixIcon: Icon(Icons.search),
                  )),

              //TEMP
              ElevatedButton(onPressed: () {}, child: const Text('request'))
              // TEMP
            ],
          ),
        ),
      ),
    );
  }
}
