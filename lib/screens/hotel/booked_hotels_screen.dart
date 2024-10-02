import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/models/my_bookings_model.dart';
import 'package:travelt/screens/hotel/manger/cubit/hotel_cubit.dart';
import 'package:travelt/screens/hotel/widgets/custom_booked_hotel_item.dart';
import 'package:travelt/screens/no_details_screen.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_loading_widget.dart';
import 'package:travelt/widgets/navigate_items.dart';

class BookedHotelsScreen extends StatelessWidget {
  BookedHotelsScreen({super.key,});

  MyBookingsModel? myBookingsModel;

  @override
  Widget build(BuildContext context) {
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
        create: (context) => HotelCubit()..getMyBookings(),
        child: BlocConsumer<HotelCubit, HotelState>(
          listener: (context, state){
            if(state is HotelMyBookingErrorState){
              navigateWithSlideFromRight(context, const NoDetailsScreen());
            }
          },
          builder: (context, state){
            myBookingsModel = HotelCubit.get(context).myBookingsModel;
            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
              ),
              body: ConditionalBuilder(
                condition: state is! HotelMyBookingLoadingState,
                builder: (context) {
                  return CustomBookedHotelItem(
                    start: myBookingsModel!.data!.hotels!.first.start!,
                    end: myBookingsModel!.data!.hotels!.first.end!,
                    persons: myBookingsModel!.data!.hotels!.first.persons!,
                    total: myBookingsModel!.data!.hotels!.first.total!,
                    taken: myBookingsModel!.data!.hotels!.first.taken!,
                    roomId: myBookingsModel!.data!.hotels!.first.room!.id!,
                    hotelId: myBookingsModel!.data!.hotels!.first.id!,
                  );
                },
                fallback: (context) => Center(child: CustomLoadingWidget()),
              ),
            );
          },
        ),
      ),
    );
  }
}
