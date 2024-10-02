import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travelt/models/go_flights_model.dart';
import 'package:travelt/models/my_flight_booking_model.dart';
import 'package:travelt/screens/flight/cubit/flight_cubit.dart';
import 'package:travelt/screens/flight/my_booking_flight_screen.dart';
import 'package:travelt/screens/flight/widgets/custom_flights_list.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_loading_widget.dart';
import 'package:travelt/widgets/custom_toast_widget.dart';
import 'package:travelt/widgets/navigate_items.dart';

class FlightListScreen extends StatelessWidget {
  const FlightListScreen({super.key, required this.goFlightsModel});

  final GoFlightsModel goFlightsModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FlightCubit(),
        child: Container(
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
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                // actions: [
                //   Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
                //     child: GestureDetector(
                //         onTap: (){
                //           navigateWithSlideFromRight(context, MyBookingFlightScreen(myFlightBookingModel: MyFlightBookingModel(),));
                //         },
                //         child: const Icon(Iconsax.book)),
                //   )
                // ],
              ),
              backgroundColor: Colors.transparent,
              body: BlocBuilder<FlightCubit, FlightState>(
                builder: (context, state){
                  if(state is BookFlightErrorState){
                    showToast("There is no full amount to pay, please top up the balance and then try again", ToastState.ERROR);
                  }
                  if(state is FlightLoadingState){
                    return Center(child: CustomLoadingWidget());
                  }else if(state is FlightSuccessState){
                    return CustomFlightsList(goFlightsModel: state.goFlightsModel,);
                  }else if(state is FlightErrorState){
                    return const Center(child: Text('Error loading hotels'));
                  }
                  return CustomFlightsList(goFlightsModel: goFlightsModel,);
                },
              ),
            ),
          ),
        ),
    );
  }
}
