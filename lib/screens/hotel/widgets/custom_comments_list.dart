import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:travelt/screens/hotel/manger/cubit/hotel_cubit.dart';
import 'package:travelt/widgets/custom_divider.dart';
import 'package:travelt/widgets/text_items.dart';

class CustomCommentsList extends StatelessWidget {
  const CustomCommentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelCubit, HotelState>(
      builder: (context, state){
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  detailsText(HotelCubit.get(context).hotelDetailsModel?.data![1].comment![index].user!.name! ?? "", size: 16, color: Colors.black),
                  RatingBar.builder(
                    initialRating: HotelCubit.get(context).hotelDetailsModel?.data![1].comment![index].rate!.toDouble() ?? 1,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.deepOrange,
                    ),
                    onRatingUpdate: (rating) {},
                    itemSize: 20,
                  )
                ],
              ),
              subtitle: detailsText(HotelCubit.get(context).hotelDetailsModel?.data![1].comment![index].comment! ?? "", size: 14, color: Colors.black),
            );
          },
          itemCount: HotelCubit.get(context).hotelDetailsModel?.data![1].comment?.length ?? 1,
          separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: CustomDividerItem(),
          ),
        );
      },
    );
  }
}
