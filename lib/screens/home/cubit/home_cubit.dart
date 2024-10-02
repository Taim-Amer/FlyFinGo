import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travelt/layout/tourism_layout.dart';
import 'package:travelt/screens/city/cities_screen.dart';
import 'package:travelt/screens/flight/flight_round_screen.dart';
import 'package:travelt/screens/hotel/hotels_screen.dart';
import 'package:travelt/screens/flight/flights_screen.dart';
import 'package:travelt/screens/house/house_screen.dart';
import 'package:travelt/screens/weather/weather_search_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  List<String> titles = [
    "Hotels",
    "Cities",
    "Weather",
    "Flight",
    "Flight Round",
    "Homes"
  ];

  List<Icon> icons = [
    const Icon(Icons.account_balance_outlined,size: 35,),
    const Icon(Icons.map_outlined,size: 35, ),
    const Icon(Icons.sunny,size: 35,),
    const Icon(Icons.flight,size: 35,),
    const Icon(Icons.flight_takeoff,size: 35,),
    const Icon(Icons.home,size: 35,),
  ];

  List<Widget> widgets = [
    const HotelsScreen(),
    const CitiesScreen(),
    WeatherSearchScreen(),
    const FlightsScreen(),
    const FlightRoundScreen(),
    const HouseScreen()
  ];
}
