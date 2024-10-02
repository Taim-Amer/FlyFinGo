import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/models/hotel_model.dart';
import 'package:travelt/screens/hotel/hotel_details_screen.dart';
import 'package:travelt/screens/hotel/manger/cubit/hotel_cubit.dart';
import 'package:travelt/screens/hotel/widgets/custom_hotel_item.dart';
import 'package:travelt/widgets/custom_staggered_list_animation.dart';
import 'package:travelt/widgets/navigate_items.dart';

class CustomHotelsList extends StatelessWidget {
  const CustomHotelsList({super.key, required this.hotelModel});

  final HotelsModel hotelModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelCubit, HotelState>(
      builder: (context, state){

        return CustomStaggeredListAnimation(
          widgetBuilder: (index) =>
              CustomHotelItem(
                name: hotelModel.data![index].name ?? 'No name',
                description: hotelModel.data![index].description ?? 'No description',
                price: '${hotelModel.data![index].price}',
                lat: hotelModel.data![index].latitude!,
                long: hotelModel.data![index].longitude!,
                phone: hotelModel.data![index].phoneHotel ?? "",
                rate: hotelModel.data![index].rate.toString(),
                photoUrl: hotelModel.data![index].photoUrl ?? "assets/images/Four Seasons.jpg",
                function: () {
                  navigateWithFade(context, HotelDetailsScreen(
                    hotelId: hotelModel.data![index].id.toString(),
                    hotelName: hotelModel.data![index].name!,
                    hotelRooms: hotelModel.data![index].rooms!,
                    initialRating: hotelModel.data![index].rate!.toDouble(),
                    price: hotelModel.data![index].price.toString() ?? "",
                    rate: hotelModel.data![index].rate.toString() ?? "",
                  ));
                },
                buttonFunction: (){
                  HotelCubit.get(context).changeFavourite(id: hotelModel.data![index].id!);
                },
                isFavourite: HotelCubit.get(context).favourites[hotelModel.data![index].id] ?? false,
                // isFavourite: HotelCubit.get(context).favourites[1]!,
                // isFavourite: false,
              ),
          count: hotelModel.data!.length,
        );
      },
    );
  }
}