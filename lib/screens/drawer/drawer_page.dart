import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travelt/screens/plan_screen.dart';
import 'package:travelt/screens/themes/theme_screen.dart';
import 'package:travelt/screens/user/cubit/profile_cubit.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/screens/user/profile_screen.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_divider.dart';
import 'package:travelt/widgets/navigate_items.dart';
import 'package:travelt/widgets/text_items.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProfileCubit()..getProfile(),
        child: Padding(
          padding: const EdgeInsets.only(top: 100 , bottom: 90 , right: 40 , left: 40),
          child: Drawer(
              backgroundColor: Colors.transparent,
              width: 500,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.transparent.withOpacity(.8),
                  gradient: RadialGradient(
                      radius: 2,
                      colors: [
                        // secondColor,
                        defaultColor,
                        secondColor,
                      ]
                  ),
                ),
                child: BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state){
                    return Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:
                          [
                            state is! ProfileLoadingState? titleText(ProfileCubit.get(context).profileModel!.data!.name!) : SizedBox(),
                            const SizedBox(height: 20,),
                            state is! ProfileLoadingState? detailsText(ProfileCubit.get(context).profileModel!.data!.email! , color: wightGreyColor) :SizedBox(),
                            const SizedBox(height: 10,),
                            state is! ProfileLoadingState? detailsText("${ProfileCubit.get(context).profileModel!.data!.money} XP", color: wightGreyColor) : SizedBox(),
                            const SizedBox(height: 30,),
                            const CustomDividerItem(),
                            ListView(
                              shrinkWrap: true,
                              children:
                              [
                                ListTile(
                                  leading: const Icon(
                                    Iconsax.user,
                                    color: wightGreyColor,
                                  ),
                                  title: detailsText("Profile", color: wightGreyColor),
                                  // subtitle: ,
                                  onTap: (){
                                    navigateWithSlideFromRight(context, ProfileScreen());
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(
                                    Iconsax.color_swatch,
                                    color: wightGreyColor,
                                  ),
                                  title: detailsText("Theme", color: wightGreyColor),
                                  // subtitle: ,
                                  onTap: (){
                                    navigateWithFade(context, const ThemeScreen());
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(
                                    Iconsax.info_circle,
                                    color: wightGreyColor,
                                  ),
                                  title: detailsText("Help", color: wightGreyColor),
                                  // subtitle: ,
                                  onTap: (){
                                    navigateWithFade(context, const PlanScreen());
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 40,),
                            const CustomDividerItem(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
          ),
        ),
    );
  }
}
