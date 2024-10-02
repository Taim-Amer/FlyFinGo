import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/models/hotel_model.dart';
import 'package:travelt/screens/hotel/manger/cubit/hotel_cubit.dart';
import 'package:travelt/screens/hotel/widgets/custom_room_item.dart';
import 'package:travelt/widgets/custom_staggered_list_animation.dart';
import 'package:travelt/widgets/custom_toast_widget.dart';

class CustomRoomsList extends StatelessWidget {
  const CustomRoomsList({super.key, required this.hotelRooms, required this.price, required this.rate});

  final String price;
  final String rate;
  final List<Rooms> hotelRooms;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit, HotelState>(
      listener: (context, state){
        if(state is HotelRoomBookingSuccessState){
          showToast(state.roomBookingModel.message ?? "", ToastState.SUCCESS);
        }
      },
      builder: (context, state) {
        return LayoutBuilder(
          builder: (context, constraints) {
            double totalHeight = 260 * hotelRooms.length.toDouble();
            return SizedBox(
              height: totalHeight,
              child: CustomStaggeredListAnimation(
                physics: const NeverScrollableScrollPhysics(),
                isHorizontal: false,
                widgetBuilder: (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomRoomItem(
                    id: hotelRooms[index].id.toString(),
                    personNumber: hotelRooms[index].personNum!,
                    number: hotelRooms[index].number!,
                    isBooking: hotelRooms[index].isBooking!,
                    price: price,
                    rate: rate,
                  ),
                ),
                count: hotelRooms.length,
              ),
            );
          },
        );
      },
    );
  }
}