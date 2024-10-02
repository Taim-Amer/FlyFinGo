import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/models/my_flight_booking_model.dart';
import 'package:travelt/screens/flight/cubit/flight_cubit.dart';
import 'package:travelt/screens/flight/widgets/my_booking_flights_list.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_loading_widget.dart';
import 'package:travelt/widgets/custom_toast_widget.dart';
import 'package:travelt/widgets/navigate_items.dart';
import 'package:travelt/widgets/text_items.dart';

class MyBookingFlightScreen extends StatelessWidget {
  const MyBookingFlightScreen({super.key, required this.myFlightBookingModel});

  final MyFlightBookingModel myFlightBookingModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FlightCubit()..getMyFlightBooking(),
      child: BlocBuilder<FlightCubit, FlightState>(
        builder: (context, state) {
          if(state is CancelFlightErrorState){
            navigateWithFade(context, MyBookingFlightScreen(myFlightBookingModel: myFlightBookingModel));
          }
          if(state is CancelFlightLoadingState){
            return Center(child: CustomLoadingWidget(),);
          }
          if(state is CancelFlightSuccessState){
            showToast(state.cancelFlightModel.message ?? "", ToastState.SUCCESS);
            navigateWithFade(context, MyBookingFlightScreen(myFlightBookingModel: myFlightBookingModel));
          }
          if(state is MyFlightBookingLoadingState){
            return Center(child: CustomLoadingWidget(),);
          }else if(state is MyFlightBookingSuccessState){
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
                appBar: AppBar(
                  title: titleText("My Booking Flights", size: 20),
                  backgroundColor: Colors.transparent,
                ),
                backgroundColor: Colors.transparent,
                body: MyBookingFlightsList(myFlightBookingModel: state.myFlightBookingModel,),
              ),
            );
          }
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
              appBar: AppBar(
                title: titleText("My Booking Flights", size: 16),
                backgroundColor: Colors.transparent,
              ),
              backgroundColor: Colors.transparent,
              body: MyBookingFlightsList(myFlightBookingModel: myFlightBookingModel,),
            ),
          );
        },
      ),
    );
  }
}
