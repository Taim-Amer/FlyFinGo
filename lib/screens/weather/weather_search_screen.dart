import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/screens/weather/cubit/weather_cubit.dart';
import 'package:travelt/screens/weather/weather_details_screen.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_background.dart';
import 'package:travelt/widgets/custom_button.dart';
import 'package:travelt/widgets/custom_snack_bar.dart';
import 'package:travelt/widgets/navigate_items.dart';
import 'package:travelt/widgets/custom_text_field.dart';

class WeatherSearchScreen extends StatelessWidget {
  WeatherSearchScreen({super.key});

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => WeatherCubit(),
        child: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (context, state) {
            if (state is WeatherSuccess) {
              searchController.clear();
            }
          },
          builder: (context, state) {
            return CustomBackground(widget: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Container(
                  width: size.width * .90,
                  height: size.height * .70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          wightGreyColor.withOpacity(0.6),
                          BlendMode.dst,
                        ),
                        image: const AssetImage(
                            "assets/images/Sora.jpg"
                        )
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: thirdColor.withOpacity(.3),
                    boxShadow: [
                      BoxShadow(
                        color: textColor.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTextField(
                          controller: searchController,
                          type: TextInputType.text,
                          validator: (string) {},
                          label: "Search weather Now",
                          prefix: Iconsax.cloud,
                          color1: defaultColor,
                          color2: defaultColor,
                          color3: wightGreyColor,
                          onSubmit: () {
                            WeatherCubit.get(context).getWeather(searchController.text);
                            navigateTo(
                                context,
                                WeatherDetailsScreen(cityName: searchController.text,)
                            );
                          },
                        ),
                        const SizedBox(height: 30,),
                        CustomButton(
                          function: (){
                            if(searchController.text.isNotEmpty){
                              WeatherCubit.get(context).getWeather(searchController.text);
                              navigateTo(
                                  context,
                                  WeatherDetailsScreen(cityName: searchController.text,)
                              );
                            }else{
                              CustomSnackBarWidget(message: 'Please enter a valid details ... ',);
                            }
                          },
                          text: "get weather",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
          },
        ),
    );
  }
}
