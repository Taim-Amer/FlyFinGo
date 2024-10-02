import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travelt/models/hotel_model.dart';
import 'package:travelt/models/my_bookings_model.dart';
import 'package:travelt/models/room_booking_model.dart';
import 'package:travelt/screens/hotel/booked_hotels_screen.dart';
import 'package:travelt/screens/hotel/manger/cubit/hotel_cubit.dart';
import 'package:travelt/screens/hotel/widgets/custom_comments_list.dart';
import 'package:travelt/screens/hotel/widgets/custom_gallery_list.dart';
import 'package:travelt/screens/hotel/widgets/custom_hotel_gallery_indicator.dart';
import 'package:travelt/screens/hotel/widgets/custom_rooms_list.dart';
import 'package:travelt/screens/hotel/widgets/custom_services_list.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/screens/hotel/widgets/custom_rating_widget.dart';
import 'package:travelt/screens/hotel/widgets/custom_write_comment.dart';
import 'package:travelt/widgets/navigate_items.dart';
import 'package:travelt/widgets/text_button_item.dart';
import 'package:travelt/widgets/text_items.dart';

class HotelDetailsScreen extends StatelessWidget {
  HotelDetailsScreen({
    super.key,
    required this.hotelId,
    required this.hotelName,
    required this.hotelRooms,
    required this.initialRating,
    required this.price,
    required this.rate,
  });

  final String hotelId;
  final String hotelName;
  final double initialRating;
  final String price;
  final String rate;
  final List<Rooms> hotelRooms;
  var commentController = TextEditingController();
  var rateController = TextEditingController();
  var controller = PageController();
  int? id;

  @override
  Widget build(BuildContext context) {
    var photos = [
      "assets/images/hotel2.jpg",
      "assets/images/hotel1.jpg",
      "assets/images/hotel3.jpg",
    ];
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              secondColor,
              wightGreyColor,
              textColor,
            ]),
      ),
      child: BlocProvider(
        create: (context) {
          var function = HotelCubit()..showHotelDetails(hotelId: hotelId);
          id = int.tryParse(hotelId);
          return function;
        },
        child: BlocBuilder<HotelCubit, HotelState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                title: titleText(hotelName, size: 18),
                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: GestureDetector(
                        onTap: (){
                          navigateWithSlideFromRight(context, BookedHotelsScreen(),);
                        },
                        child: const Icon(Iconsax.book)),
                  )
                ],
              ),
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomGalleryList(
                      images: photos,
                      controller: controller,
                    ),
                    CustomHotelGalleryIndicator(
                      controller: controller,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: CustomServicesList(),
                    ),
                    CustomRoomsList(
                      hotelRooms: hotelRooms,
                      price: price,
                      rate: rate,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CustomRatingWidget(
                            controller: rateController,
                            initialRating: initialRating,
                          ),
                          const SizedBox(height: 16.0),
                          CustomWriteComment(
                              commentController: commentController,
                              rateController: rateController,
                              hotelId: hotelId),
                          const CustomCommentsList(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
