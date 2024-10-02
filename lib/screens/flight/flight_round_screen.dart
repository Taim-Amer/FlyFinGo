import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/models/flight_round_model.dart';
import 'package:travelt/screens/flight/cubit/flight_cubit.dart';
import 'package:travelt/screens/flight/flight_list_screen.dart';
import 'package:travelt/screens/flight/flight_round_list_screen.dart';
import 'package:travelt/screens/flight/widgets/custom_flight_round_card.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_toast_widget.dart';
import 'package:travelt/widgets/navigate_items.dart';

class FlightRoundScreen extends StatelessWidget {
  const FlightRoundScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FlightCubit(),
        child: BlocConsumer<FlightCubit, FlightState>(
          listener: (context, state){
            if(state is FlightRoundErrorState){
              print(state.error.toString());
              showToast("Not found , Please check the entered data and try agian !", ToastState.WARNING);
            } else if(state is FlightRoundSuccessState){
              navigateWithFade(context, FlightRoundListScreen(flightRoundModel: state.flightRoundModel,));
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
                body: CustomFlightRoundCard(),
              ),
            );
          },
        ),
    );
  }
}
