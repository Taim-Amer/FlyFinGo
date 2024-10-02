import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travelt/screens/flight/cubit/flight_cubit.dart';
import 'package:travelt/screens/flight/widgets/custom_flight_item.dart';
import 'package:travelt/shared/network/local/cache_helper.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/widgets/custom_toast_widget.dart';
import 'package:travelt/widgets/text_items.dart';

class CustomMyBookingFlightItem extends StatelessWidget {
  const CustomMyBookingFlightItem({super.key, required this.date, required this.duration, required this.takeOff, required this.landing, required this.capacity, required this.currentCity, required this.destinationCity, required this.officeName, required this.stopsNumber, required this.id,});

  final String date;
  final String duration;
  final String takeOff;
  final String landing;
  final int capacity;
  final String currentCity;
  final String destinationCity;
  final String officeName;
  final int stopsNumber;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 400,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Iconsax.map, color: Colors.blueAccent, size: 18),  // Reduced icon size
                          const SizedBox(width: 5),
                          subTitleText(currentCity),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Iconsax.arrow_right_1, color: Colors.grey, size: 18),  // Reduced icon size
                          const SizedBox(width: 5),
                          subTitleText(destinationCity),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          const Icon(Iconsax.calendar_1, color: Colors.orange, size: 18),  // Reduced icon size
                          const SizedBox(width: 5),
                          subTitleText(date),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Iconsax.clock, color: Colors.redAccent, size: 18),  // Reduced icon size
                          const SizedBox(width: 5),
                          Text(
                            "Duration: $duration",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/flight_background2.jpg"),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: const [0.5, 1],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Take Off and Landing
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Iconsax.airplane, color: Colors.green, size: 18),  // Reduced icon size
                          const SizedBox(width: 5),
                          Text(
                            "Take Off: $takeOff",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Iconsax.airplane, color: Colors.red, size: 18),  // Reduced icon size
                          const SizedBox(width: 5),
                          Text(
                            "Landing: $landing",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Stops and Capacity
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          const Icon(Iconsax.box, color: Colors.purple, size: 18),  // Reduced icon size
                          const SizedBox(width: 5),
                          Text(
                            "Stops: $stopsNumber",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Iconsax.people, color: Colors.teal, size: 18),  // Reduced icon size
                          const SizedBox(width: 5),
                          Text(
                            "Capacity: $capacity",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    officeName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                  BlocBuilder<FlightCubit, FlightState>(
                    builder: (context, state){
                      if(state is CancelFlightSuccessState){
                        showToast(state.cancelFlightModel.message ?? "", ToastState.WARNING);
                      }
                      return TextButton(
                        onPressed: (){
                          print(CacheHelper.getData(key: "personNumber"));
                          print(id);
                          FlightCubit.get(context).cancelFlightGo(
                              classId: 1,
                              flightGoID: id,
                              passengerNumber: CacheHelper.getData(key: "personNumber"),
                          );
                          // showToast("your flight is canceled successfully", ToastState.WARNING);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          side: const BorderSide(color: wightColor),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: wightColor),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
