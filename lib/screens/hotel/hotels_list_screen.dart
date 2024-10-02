import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/models/hotel_model.dart';
import 'package:travelt/screens/hotel/manger/chip_cubit/chip_cubit.dart';
import 'package:travelt/screens/hotel/manger/cubit/hotel_cubit.dart';
import 'package:travelt/screens/hotel/manger/radio_cubit/radio_cubit.dart';
import 'package:travelt/screens/hotel/widgets/custom_filter_list.dart';
import 'package:travelt/screens/hotel/widgets/custom_hotels_card.dart';
import 'package:travelt/screens/hotel/widgets/custom_hotels_list.dart';
import 'package:travelt/screens/house/cubit/house_cubit.dart';
import 'package:travelt/screens/house/widget/custom_house_item.dart';
import 'package:travelt/screens/no_details_screen.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_loading_widget.dart';
import 'package:travelt/widgets/navigate_items.dart';

class HotelListScreen extends StatelessWidget {
  HotelListScreen({super.key, required this.hotelModel, this.sort});

  final HotelsModel hotelModel;
  String? sort;

  @override
  Widget build(BuildContext context) {
    int? persons = int.tryParse(CustomHotelsCard.personController.text);
    // bool withChildren = RadioCubit.get(context).withChildren;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HotelCubit(),
        ),
        BlocProvider(
          create: (context) => RadioCubit(),
        ),
        BlocProvider(
          create: (context) => ChipCubit(),
        ),
      ],
      child: Container(
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
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: CustomFilterList(
                    cityName: CustomHotelsCard.cityNameController.text,
                    personNumber: persons!,
                    start: CustomHotelsCard.startController.text,
                    end: CustomHotelsCard.endController.text,
                    withChildren: true,
                    sort: sort,
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: BlocConsumer<HotelCubit, HotelState>(
                    listener: (context, state){},
                    builder: (context, state) {
                      if (state is HotelLoadingState && state is FavouriteLoadingState) {
                        return Center(child: CustomLoadingWidget());
                      } else if (state is HotelSuccessState) {
                        return CustomHotelsList(hotelModel: state.hotelModel);
                      } else if (state is HotelErrorState) {
                        return const Center(child: Text('Error loading hotels'));
                      }
                      return CustomHotelsList(hotelModel: hotelModel);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
