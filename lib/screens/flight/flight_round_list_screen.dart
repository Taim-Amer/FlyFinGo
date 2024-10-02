import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travelt/models/flight_round_model.dart';
import 'package:travelt/models/my_flight_booking_model.dart';
import 'package:travelt/screens/flight/cubit/flight_cubit.dart';
import 'package:travelt/screens/flight/my_booking_flight_screen.dart';
import 'package:travelt/screens/flight/widgets/custom_flight_round_list.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_loading_widget.dart';
import 'package:travelt/widgets/custom_toast_widget.dart';
import 'package:travelt/widgets/navigate_items.dart';

class FlightRoundListScreen extends StatelessWidget {
  const FlightRoundListScreen({super.key, required this.flightRoundModel});

  final List<FlightRoundModel> flightRoundModel;

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
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: GestureDetector(
                      onTap: (){
                        navigateWithSlideFromRight(context, MyBookingFlightScreen(myFlightBookingModel: MyFlightBookingModel(),));
                      },
                      child: const Icon(Iconsax.book)),
                )
              ],
            ),
            backgroundColor: Colors.transparent,
            body: BlocBuilder<FlightCubit, FlightState>(
              builder: (context, state){
                if(state is FlightRoundLoadingState){
                  return Center(child: CustomLoadingWidget());
                }else if(state is FlightRoundSuccessState){
                  return CustomFlightsRoundList(flightRoundModel: state.flightRoundModel,);
                }else if(state is FlightRoundErrorState){
                  return const Center(child: Text('Error loading hotels'));
                }
                if(state is BookFlightRoundSuccessState){
                  showToast(state.bookFlightRoundModel.message ?? "", ToastState.SUCCESS);
                }
                if(state is BookFlightRoundErrorState){
                  showToast("you do not have enough money, you money is 10 and the cost is 120", ToastState.ERROR);
                }
                return CustomFlightsRoundList(flightRoundModel: flightRoundModel,);
              },
            ),
          ),
        ),
      ),
    );
  }
}
