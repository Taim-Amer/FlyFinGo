
// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/models/weather_model.dart';
import 'package:travelt/shared/network/remote/weather_dio_helper.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  static WeatherCubit get(context) => BlocProvider.of(context);

  WeatherModel? weatherModel;

  Future<void> getWeather (String city) async {
    emit(WeatherLoading());
      var weatherData = await WeatherDioHelper.getWeatherData(
          url: "forecast.json",
          query: {
            "key" : "a08954f72d544e5ba72133512241403",
            "q" : city ,
          }
      ).then((value) {
        weatherModel = WeatherModel.fromJson(value.data);
        emit(WeatherSuccess(weatherModel!));
      }).catchError((error){
        emit(WeatherError(error.toString()));
      });
  }
}
