import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/screens/home/home_page.dart';
import 'package:travelt/shared/cubit/app_cubit.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/navigate_items.dart';
import 'package:travelt/screens/themes/widgets/theme_item.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit , AppState>(
      builder: (context , state) {
        var cubit = AppCubit.get(context);
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    defaultColor,
                    wightColor,
                    secondColor,
                  ],
              ),
          ),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent
              ),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    buildThemeItem(
                      defaultSkyColor,
                        secondSkyColor,
                        defaultSkyColor,
                          (){
                            cubit.changeTheme(0);
                            navigateWithFadeAndFinish(context, HomePage());
                          },
                        "Sky Theme",
                        context,
                    ),
                    buildThemeItem(
                      defaultForestColor,
                        secondForestColor,
                        defaultForestColor,
                            (){
                              cubit.changeTheme(1);
                              navigateWithFadeAndFinish(context, HomePage());
                            },
                        "Forest Theme",
                        context
                    ),
                    buildThemeItem(
                      defaultClassicColor,
                        secondClassicColor,
                        defaultClassicColor,
                          (){
                              cubit.changeTheme(2);
                              navigateWithFadeAndFinish(context, HomePage());
                            },
                        "Silver Theme",
                        context,
                    ),
                    buildThemeItem(
                        defaultAutumnColor,
                        secondAutumnColor,
                        defaultAutumnColor,
                          (){
                              cubit.changeTheme(3);
                              navigateWithFadeAndFinish(context, HomePage());
                            },
                        "Autumn Theme",
                        context,
                    ),
                    buildThemeItem(
                      defaultPinkColor,
                      secondPinkColor,
                      defaultPinkColor,
                          (){
                        cubit.changeTheme(4);
                        navigateWithFadeAndFinish(context, HomePage());
                      },
                      "Pink Theme",
                      context,
                    ),
                    buildThemeItem(
                      defaultBlackColor,
                      defaultBlackColor,
                      defaultBlackColor,
                          (){
                        cubit.changeTheme(5);
                        navigateWithFadeAndFinish(context, HomePage());
                      },
                      "Black Theme",
                      context,
                    ),
                  ],
                ),
              )
          ),
        );
      },
    );
  }
}
