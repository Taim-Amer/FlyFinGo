import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/models/my_house_booking_model.dart';
import 'package:travelt/screens/house/cubit/house_cubit.dart';
import 'package:travelt/screens/house/widget/custom_my_booking_houses_item.dart';
import 'package:travelt/widgets/custom_staggered_list_animation.dart';

class MyBookingHousesList extends StatelessWidget {
  const MyBookingHousesList({super.key, required this.myHouseBookingModel});

  final MyHouseBookingModel myHouseBookingModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HouseCubit, HouseState>(builder: (context, state) {
      return CustomStaggeredListAnimation(
        widgetBuilder: (index) => CustomMyBookingHousesItem(
            id: myHouseBookingModel.data![index].id!,
            location: myHouseBookingModel.data![index].home!.location ?? "",
            space: myHouseBookingModel.data![index].home!.space!,
            status: myHouseBookingModel.data![index].bookingStatus!,
            start: myHouseBookingModel.data![index].start!,
            end: myHouseBookingModel.data![index].end!,
            total: myHouseBookingModel.data![index].total!
        ),
        count: myHouseBookingModel.data!.length,
      );
    });
  }
}
