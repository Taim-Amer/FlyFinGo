import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travelt/models/my_house_booking_model.dart';
import 'package:travelt/models/show_house_model.dart';
import 'package:travelt/screens/house/my_booking_home_booking_screen.dart';
import 'package:travelt/screens/house/widget/custom_house_item.dart';
import 'package:travelt/screens/house/widget/custom_houses_list.dart';
import 'package:travelt/screens/house/cubit/house_cubit.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_loading_widget.dart';
import 'package:travelt/widgets/custom_toast_widget.dart';
import 'package:travelt/widgets/navigate_items.dart';

class HousesListScreen extends StatelessWidget {
  const HousesListScreen({super.key, required this.showHousesModel});

  final ShowHousesModel showHousesModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HouseCubit(),
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
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: GestureDetector(
                          onTap: (){
                            navigateWithSlideFromRight(context, MyBookingHomeBookingScreen(myHouseBookingModel: MyHouseBookingModel(),));
                          },
                          child: const Icon(Iconsax.book)),
                    )
                  ],
                ),
                backgroundColor: Colors.transparent,
                body: BlocConsumer<HouseCubit, HouseState>(
                  listener: (context, state){
                    if(state is ChangeHouseFavouriteSuccessState){

                    }
                    if(state is InsideHousePageSuccessState){
                      CustomHouseItem.isSeeMore = true;
                    }
                    if(state is BookHouseSuccessState){
                      showToast(state.bookHouseModel.message! , ToastState.SUCCESS);
                    }
                  },
                  builder: (context, state){
                    if (state is ShowHousesLoadingState) {
                      return Center(child: CustomLoadingWidget());
                    } else if (state is ShowHousesSuccessState) {
                      return CustomHousesList(showHousesModel: state.showHousesModel);
                    } else if (state is ShowHousesErrorState) {
                      return const Center(child: Text('Error loading hotels'));
                    }
                    return CustomHousesList(showHousesModel: showHousesModel);
                  },
                ),
              )
          ),
        ),
    );
  }
}
