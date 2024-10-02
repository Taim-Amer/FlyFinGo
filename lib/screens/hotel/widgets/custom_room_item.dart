import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travelt/screens/hotel/manger/cubit/hotel_cubit.dart';
import 'package:travelt/screens/hotel/widgets/custom_hotels_card.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/text_items.dart';

class CustomRoomItem extends StatelessWidget {
  CustomRoomItem({super.key, required this.id, required this.personNumber, required this.number, required this.isBooking, this.location = "", required this.price, required this.rate});

  final String id;
  final int personNumber;
  final int number;
  final int isBooking;
  final String price;
  final String rate;
  String location;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 220,
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [wightColor, secondColor.withOpacity(0.1)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            // border: Border.all(
            //   color: defaultColor,
            //   width: 1.0,
            // ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  titleText("Room ID: $id", size: 18),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
                    decoration: BoxDecoration(
                      color: isBooking == 1 ? Colors.deepOrange.withOpacity(.8) : Colors.greenAccent.withOpacity(.8),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      isBooking == 1 ? 'Popular' : 'Available',
                      style: const TextStyle(
                        color: wightColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Iconsax.location, size: 18, color: thirdColor),
                  const SizedBox(width: 5),
                  detailsText("Location: ${CustomHotelsCard.cityNameController.text}", size: 12),
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
                      detailsText("Rating: $rate", size: 12),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Iconsax.coin, size: 18, color: Colors.deepOrange),
                  const SizedBox(width: 5),
                  detailsText("Price: \$$price/night", size: 14),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(Iconsax.user, size: 18, color: Colors.green),
                  const SizedBox(width: 5),
                  detailsText("Person number: $personNumber", size: 14),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: defaultColor,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'View Details',
                        style: TextStyle(color: secondColor),
                      ),
                    ),
                    const SizedBox(width: 10),
                    BlocBuilder<HotelCubit, HotelState>(
                        builder: (context, state){
                          return TextButton(
                            onPressed: (){
                              int? id1 = int.tryParse(id);
                              int? persons = int.tryParse(CustomHotelsCard.personController.text);
                              HotelCubit.get(context).bookRoom(
                                hotelId: id1!,
                                startDate: CustomHotelsCard.startController.text,
                                endDate: CustomHotelsCard.endController.text,
                                personNumber: persons!,
                              );
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: isBooking == 1 ? wightColor : defaultColor,
                              side: BorderSide(color: defaultColor),
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Book Now',
                              style: TextStyle(color: isBooking == 1 ? Colors.grey : secondColor),
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
