part of 'weather_cubit.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final WeatherModel weatherModel;
  WeatherSuccess(this.weatherModel);

}
class WeatherError extends WeatherState {
  String error;
  WeatherError(this.error);
}
