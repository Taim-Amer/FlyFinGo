import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/models/flight_round_model.dart';
import 'package:travelt/screens/flight/cubit/flight_cubit.dart';
import 'package:travelt/screens/flight/widgets/custom_flight_round_item.dart';
import 'package:travelt/widgets/custom_staggered_list_animation.dart';

class CustomFlightsRoundList extends StatelessWidget {
  const CustomFlightsRoundList({super.key, required this.flightRoundModel});

  final List<FlightRoundModel> flightRoundModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FlightCubit, FlightState>(
      builder: (context, state) {
        return CustomStaggeredListAnimation(
          widgetBuilder: (index) =>
              CustomFlightRoundItem(
                  dateGo: flightRoundModel[index].dateGo,
                  takeoffGo: flightRoundModel[index].takeoffGo,
                  landingGo: flightRoundModel[index].landingGo,
                  durationGo: flightRoundModel[index].durationGo,
                  dateBack: flightRoundModel[index].dateBack,
                  takeoffBack: flightRoundModel[index].takeoffBack,
                  landingBack: flightRoundModel[index].landingBack,
                  durationBack: flightRoundModel[index].durationBack,
                  capacity: flightRoundModel[index].capacity,
                  officeName: flightRoundModel[index].office.name,
                  currentCity: flightRoundModel[index].fromCity.name,
                  destinationCity: flightRoundModel[index].toCity.name,
                  services: flightRoundModel[index].services.map((service) => service.name).toList(),
                  isEnable: flightRoundModel[index].classes.isEmpty ? false : true,
                  id: flightRoundModel[index].id,
                  // id: id,
                  // isEnable: isEnable,
              ),
          count: flightRoundModel.length,
        );
      },
    );
  }
}
