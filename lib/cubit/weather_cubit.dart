import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/models/weather_response.dart';
import 'package:weather_bloc/service/fetch_servise.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());

  final WeatherService weatherService;

  Future<void> getWeatherByCityName(String cityName) async {
    emit(WeatherLoding());
    final date = await weatherService.getWeatherByCityName(cityName);
    if (date != null) {
      emit(WeatherSucces(date));
    } else {
      emit(WeatherError('kata bar'));
    }
  }
}
