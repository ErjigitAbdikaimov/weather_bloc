import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/cubit/weather_cubit.dart';
import 'package:weather_bloc/models/weather_response.dart';
import 'package:weather_bloc/service/fetch_servise.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WeatherCubit(weatherService)..getWeatherByCityName('bishkek'),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Center(
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              return const Text('WeatherInitial');
            } else if (state is WeatherLoding) {
              return const CircularProgressIndicator();

              // return const Text('WeatherLoading');
            } else if (state is WeatherSucces) {
              return WeatherSuccesWidget(state.weatherResponse);
            } else if (state is WeatherError) {
              return const Text('WeatherError');
            } else {
              return const Text('bilbedim');
            }
          },
        ),
      ),
    );
  }
}

class WeatherSuccesWidget extends StatelessWidget {
  const WeatherSuccesWidget(this.weatherResponse, {super.key});
  final WeatherResponse weatherResponse;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(weatherResponse.name),
          Text(weatherResponse.weather[0].id.toString()),
          Text(weatherResponse.weather[0].main.toString()),
          Text(weatherResponse.weather[0].description.toString()),
          Text(weatherResponse.weather[0].icon.toString()),
          Text(weatherResponse.main.temp.toString()),
          Text(weatherResponse.main.feelsLike.toString()),
          Text(weatherResponse.main.tempMin.toString()),
          Text(weatherResponse.main.tempMax.toString()),
        ],
      ),
    );
  }
}
