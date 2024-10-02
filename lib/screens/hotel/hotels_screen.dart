import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/screens/hotel/hotels_list_screen.dart';
import 'package:travelt/screens/hotel/manger/cubit/hotel_cubit.dart';
import 'package:travelt/widgets/custom_background.dart';
import 'package:travelt/screens/hotel/widgets/custom_hotels_card.dart';
import 'package:travelt/widgets/custom_toast_widget.dart';
import 'package:travelt/widgets/navigate_items.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => HotelCubit(),
      child: BlocConsumer<HotelCubit, HotelState>(
        listener: (context, state) {
          if (state is HotelErrorState) {
            showToast("Not found , Please check the entered data and try agian !", ToastState.WARNING);
          } else if (state is HotelSuccessState) {
            navigateWithFade(context, HotelListScreen(hotelModel: state.hotelModel,));
          }

        },
        builder: (context, state) {
          return CustomBackground(
            widget: Scaffold(
              backgroundColor: Colors.transparent,
              body: CustomHotelsCard(),
            ),
          );
        },
      ),
    );
  }
}
