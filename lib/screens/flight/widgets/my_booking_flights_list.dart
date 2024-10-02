import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/models/my_flight_booking_model.dart';
import 'package:travelt/screens/flight/cubit/flight_cubit.dart';
import 'package:travelt/screens/flight/widgets/custom_my_booking_flight_item.dart';
import 'package:travelt/shared/network/local/cache_helper.dart';
import 'package:travelt/widgets/custom_staggered_list_animation.dart';

class MyBookingFlightsList extends StatelessWidget {
  const MyBookingFlightsList({super.key, required this.myFlightBookingModel});

  final MyFlightBookingModel myFlightBookingModel;

  @override
  Widget build(BuildContext context) {
    return CustomStaggeredListAnimation(
      widgetBuilder: (index) => CustomMyBookingFlightItem(
        id: myFlightBookingModel.data![index].id!,
        date: myFlightBookingModel.data![index].date ?? "",
        duration: myFlightBookingModel.data![index].duration ?? "",
        takeOff: myFlightBookingModel.data![index].takeoff ?? "",
        landing: myFlightBookingModel.data![index].landing ?? "",
        capacity: myFlightBookingModel.data![index].capacity ?? 0,
        currentCity: myFlightBookingModel.data![index].fromCity?.name ?? "",
        destinationCity: myFlightBookingModel.data![index].toCity?.name ?? "",
        officeName: myFlightBookingModel.data![index].office?.name ?? "",
        stopsNumber: myFlightBookingModel.data![index].numStops ?? 0,
      ),
      count: myFlightBookingModel.data!.length,
    );
  }
}
