part of 'city_cubit.dart';

abstract class CityState {}

class CityInitial extends CityState {}

//fetch

class CitiesLoadingState extends CityState {}

class CitiesSuccessState extends CityState {
  final CityModel cityModel;
  CitiesSuccessState(this.cityModel);
}

class CitiesErrorState extends CityState {
  final String error;
  CitiesErrorState(this.error);
}

//search

class CitiesSearchLoadingState extends CityState {}

class CitiesSearchSuccessState extends CityState {
  final CitySearchModel citySearchModel;
  CitiesSearchSuccessState(this.citySearchModel);
}

class CitiesSearchErrorState extends CityState {
  final String error;
  CitiesSearchErrorState(this.error);
}
