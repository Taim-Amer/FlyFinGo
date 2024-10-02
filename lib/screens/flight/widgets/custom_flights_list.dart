import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/models/go_flights_model.dart';
import 'package:travelt/screens/flight/cubit/flight_cubit.dart';
import 'package:travelt/screens/flight/widgets/custom_flight_item.dart';
import 'package:travelt/widgets/custom_staggered_list_animation.dart';

class CustomFlightsList extends StatelessWidget {
  const CustomFlightsList({super.key, required this.goFlightsModel});

  final GoFlightsModel goFlightsModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightCubit, FlightState>(
        builder: (context, state){
          return CustomStaggeredListAnimation(
              widgetBuilder: (index) => CustomFlightItem(
                id: goFlightsModel.data![index].id ?? 0,
                date: goFlightsModel.data![index].date ?? "",
                duration: goFlightsModel.data![index].duration ?? "",
                takeOff: goFlightsModel.data![index].takeoff ?? "",
                landing: goFlightsModel.data![index].landing ?? "",
                capacity: goFlightsModel.data![index].capacity ?? 0,
                currentCity: goFlightsModel.data![index].fromCity?.name ?? "",
                destinationCity: goFlightsModel.data![index].toCity?.name ?? "",
                officeName: goFlightsModel.data![index].office!.name ?? "",
                stopsNumber: goFlightsModel.data![index].numStops ?? 0,
                isEnable: goFlightsModel.data![index].classes!.isEmpty ? false : true,
              ),
              count: goFlightsModel.data!.length,
          );
        },
    );
  }
}
