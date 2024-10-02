import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travelt/screens/hotel/manger/cubit/hotel_cubit.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/text_items.dart';

class CustomBookedHotelItem extends StatelessWidget {
  const CustomBookedHotelItem({super.key, required this.start, required this.end, required this.persons, required this.total, required this.taken, required this.roomId, required this.hotelId});

  final String start;
  final String end;
  final int persons;
  final int total;
  final int taken;
  final int roomId;
  final int hotelId;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [wightColor, secondColor.withOpacity(0.1)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleText("Room ID: $roomId", size: 18),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Iconsax.location, size: 18, color: thirdColor),
                  const SizedBox(width: 5),
                  detailsText("Start Time: $start", size: 12),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Iconsax.star, size: 18, color: Colors.amber),
                      const SizedBox(width: 5),
                      detailsText("End Time: $end", size: 12),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Iconsax.coin, size: 18, color: Colors.deepOrange),
                  const SizedBox(width: 5),
                  detailsText("Total: $total", size: 14),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Iconsax.user, size: 18, color: Colors.green),
                  const SizedBox(width: 5),
                  detailsText("Person number: $persons", size: 14),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BlocBuilder<HotelCubit, HotelState>(
                        builder: (context, state){
                          return TextButton(
                            onPressed: () {
                              HotelCubit.get(context).cancelHotel(
                                  hotelId: hotelId,
                                  roomId: roomId,
                                  startDate: start,
                                  endDate: end,
                              );
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: thirdColor,
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: wightColor),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}