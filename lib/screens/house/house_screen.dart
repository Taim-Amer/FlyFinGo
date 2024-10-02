import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/screens/house/cubit/house_cubit.dart';
import 'package:travelt/screens/house/houses_list_screen.dart';
import 'package:travelt/screens/house/widget/custom_houses_card.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_toast_widget.dart';
import 'package:travelt/widgets/navigate_items.dart';

class HouseScreen extends StatelessWidget {
  const HouseScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HouseCubit(),
        child: BlocConsumer<HouseCubit, HouseState>(
          listener: (context, state){
            if(state is ShowHousesErrorState){
              showToast("Not found , Please check the entered data and try agian !", ToastState.WARNING);
            }else if (state is ShowHousesSuccessState){
              navigateWithFade(context, HousesListScreen(showHousesModel: state.showHousesModel,));
            }
          },
          builder: (context, state){
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
                  backgroundColor: Colors.transparent,
                  body: CustomHousesCard()
              ),
            );
          },
        ),
    );
  }
}
