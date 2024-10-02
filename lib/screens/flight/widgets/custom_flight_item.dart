import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travelt/screens/flight/cubit/flight_cubit.dart';
import 'package:travelt/shared/network/local/cache_helper.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_toast_widget.dart';
import 'package:travelt/widgets/text_items.dart';

class CustomFlightItem extends StatefulWidget {
  const CustomFlightItem({
    super.key,
    required this.date,
    required this.duration,
    required this.takeOff,
    required this.landing,
    required this.capacity,
    required this.currentCity,
    required this.destinationCity,
    required this.officeName,
    required this.stopsNumber,
    this.function,
    required this.isEnable,
    required this.id,
  });

  final int id;
  final String date;
  final String duration;
  final String takeOff;
  final String landing;
  final int capacity;
  final String currentCity;
  final String destinationCity;
  final String officeName;
  final int stopsNumber;
  final VoidCallback? function;
  final bool isEnable;

  @override
  State<CustomFlightItem> createState() => _CustomFlightItemState();
}

class _CustomFlightItemState extends State<CustomFlightItem> {
  int personNumber = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.function,
      child: Padding(
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
                            subTitleText(widget.currentCity),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Iconsax.arrow_right_1, color: Colors.grey, size: 18),  // Reduced icon size
                            const SizedBox(width: 5),
                            subTitleText(widget.destinationCity),
                          ],
                        ),
                      ],
                    ),
                    // Flight Date and Duration
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            const Icon(Iconsax.calendar_1, color: Colors.orange, size: 18),  // Reduced icon size
                            const SizedBox(width: 5),
                            subTitleText(widget.date),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Iconsax.clock, color: Colors.redAccent, size: 18),  // Reduced icon size
                            const SizedBox(width: 5),
                            Text(
                              "Duration: ${widget.duration}",
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
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          widget.isEnable ? Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: defaultColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove, color: wightGreyColor, size: 16),
                                  onPressed: () {
                                    setState(() {
                                      if (personNumber > 1) personNumber--;
                                      CacheHelper.saveData(key: "personNumber", value: personNumber);
                                    });
                                  },
                                ),
                                Text(
                                  "$personNumber",
                                  style: const TextStyle(
                                    color: wightGreyColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add, color: wightGreyColor, size: 16),
                                  onPressed: () {
                                    setState(() {
                                      personNumber++;
                                      CacheHelper.saveData(key: "personNumber", value: personNumber);
                                    });
                                  },
                                ),
                              ],
                            ),
                          ) : const SizedBox(),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: widget.isEnable ? Colors.green : Colors.red,  // Conditional color
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              widget.isEnable ? "Enabled" : "Disabled",  // Conditional text
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // const SizedBox(width: 10),
                        ],
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
                              "Take Off: ${widget.takeOff}",
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
                              "Landing: ${widget.landing}",
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
                              "Stops: ${widget.stopsNumber}",
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
                              "Capacity: ${widget.capacity}",
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
                      widget.officeName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                      ),
                    ),
                    BlocBuilder<FlightCubit, FlightState>(
                      builder: (context, state){
                        if(state is BookFlightSuccessState){
                          showToast(state.bookFlightModel.message ?? "", ToastState.SUCCESS);
                          if(state.bookFlightModel.status == 404){
                            showToast(state.bookFlightModel.message ?? "", ToastState.ERROR);
                          }
                        }
                        return TextButton(
                          onPressed: (){
                            if(widget.isEnable){
                              print(widget.isEnable);
                              print(personNumber);
                              print(widget.id);
                              FlightCubit.get(context).bookFlight(
                                  personNumber: personNumber,
                                  classId: 1,
                                  flightGoId: widget.id
                              );
                            }
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: widget.isEnable  ? defaultColor : wightGreyColor,
                            side: BorderSide(color: defaultColor),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Book Now',
                            style: TextStyle(color: widget.isEnable ? Colors.grey : secondColor),
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
      ),
    );
  }
}
