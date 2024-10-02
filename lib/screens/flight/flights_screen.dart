import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/screens/flight/cubit/flight_cubit.dart';
import 'package:travelt/screens/flight/flight_list_screen.dart';
import 'package:travelt/screens/flight/widgets/custom_card_flight.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_toast_widget.dart';
import 'package:travelt/widgets/navigate_items.dart';

class FlightsScreen extends StatelessWidget {
  const FlightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FlightCubit(),
        child: BlocConsumer<FlightCubit, FlightState>(
          listener: (context, state){
            if(state is FlightErrorState){
              showToast("Not found , Please check the entered data and try agian !", ToastState.WARNING);
            } else if(state is FlightSuccessState){
              navigateWithFade(context, FlightListScreen(goFlightsModel: state.goFlightsModel,));
            }
            if(state is BookFlightErrorState){
              showToast("you do not have enough money, you money is 10 and the cost is 130", ToastState.ERROR);
            }
          },
          builder: (context, state){
            return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        defaultColor,
                        wightColor,
                        secondColor,
                      ]
                  )
              ),
              child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: CustomFlightsCard()
              ),
            );
          },
        ),
    );
  }
}