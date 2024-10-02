import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/screens/hotel/manger/cubit/hotel_cubit.dart';
import 'package:travelt/screens/hotel/widgets/custom_service_item.dart';
import 'package:travelt/widgets/custom_staggered_list_animation.dart';

class CustomServicesList extends StatelessWidget {
  const CustomServicesList({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelCubit, HotelState>(
        builder: (context, state){
          return SizedBox(
            height: 100,
            child: CustomStaggeredListAnimation(
              isHorizontal: true,
              widgetBuilder: (index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomServiceItem(
                    serviceName: HotelCubit.get(context).hotelDetailsModel?.data![0].service![index].name ?? "",
                  ),
                );
              },
              count: HotelCubit.get(context).hotelDetailsModel?.data![0].service!.length ?? 0,
            ),
          );
        },
    );
  }
}