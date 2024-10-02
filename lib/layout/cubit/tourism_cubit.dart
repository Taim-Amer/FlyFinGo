import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/screens/city/cities_screen.dart';
import 'package:travelt/screens/hotel/hotels_screen.dart';
import 'package:travelt/screens/user/profile_screen.dart';

part 'tourism_state.dart';

class TourismCubit extends Cubit<TourismState> {
  TourismCubit() : super(TourismInitialState());

  static TourismCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<IconData> icons = [
    Icons.account_balance_outlined,
    Icons.map_outlined,
    Icons.flight,
  ];

  List<Widget> bottomScreen =
  [
    HotelsScreen(),
    CitiesScreen(),
    ProfileScreen()
  ];

  void changeBottom(int index)
  {
    currentIndex = index;
    emit(TourismChangeBottomNavState());
  }
}
