import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/models/my_house_booking_model.dart';
import 'package:travelt/screens/house/cubit/house_cubit.dart';
import 'package:travelt/screens/house/widget/my_booking_houses_list.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_loading_widget.dart';
import 'package:travelt/widgets/text_items.dart';

class MyBookingHomeBookingScreen extends StatelessWidget {
  const MyBookingHomeBookingScreen({super.key, required this.myHouseBookingModel});

  final MyHouseBookingModel myHouseBookingModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HouseCubit()..getMyHouseBooking(),
        child: BlocBuilder<HouseCubit, HouseState>(
          builder: (context, state) {
            if(state is MyHouseBookingLoadingState){
              return Center(child: CustomLoadingWidget(),);
            }else if(state is MyHouseBookingSuccessState){
              return Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          defaultColor,
                          wightColor,
                          secondColor,
                        ]
                    )
                ),
                child: Scaffold(
                  appBar: AppBar(
                    title: titleText("My Booking Houses", size: 20),
                    backgroundColor: Colors.transparent,
                  ),
                  backgroundColor: Colors.transparent,
                  body: MyBookingHousesList(myHouseBookingModel: state.myHouseBookingModel,),
                ),
              );
            }
            return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        defaultColor,
                        wightColor,
                        secondColor,
                      ]
                  )
              ),
              child: Scaffold(
                appBar: AppBar(
                  title: titleText("My Booking Flights"),
                  backgroundColor: Colors.transparent,
                ),
                backgroundColor: Colors.transparent,
                body: MyBookingHousesList(myHouseBookingModel: myHouseBookingModel,),
              ),
            );
          },
        )
    );
  }
}
