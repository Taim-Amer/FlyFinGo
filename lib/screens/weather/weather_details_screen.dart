import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/screens/weather/cubit/weather_cubit.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/custom_background.dart';
import 'package:travelt/widgets/custom_loading_widget.dart';
import 'package:travelt/widgets/text_items.dart';

class WeatherDetailsScreen extends StatelessWidget {
  const WeatherDetailsScreen({super.key , required this.cityName});

  final String cityName;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => WeatherCubit()..getWeather(cityName),
        child: BlocConsumer<WeatherCubit, WeatherState>(
          listener: (context, state) {},
          builder: (context, state) {

            return CustomBackground(
                widget: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Center(
                    child: Container(
                      width: size.width * .90,
                      height: size.height * .70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              defaultColor.withOpacity(0.6),
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
                        child: ConditionalBuilder(
                          condition: state is! WeatherLoading,
                          fallback: (context) => Center(child: CustomLoadingWidget()),
                          builder: (context) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                              [
                                Text(
                                  WeatherCubit.get(context).weatherModel?.cityName ?? "not found",
                                  style: TextStyle(
                                    color: defaultColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                                const SizedBox(height: 15,),
                                Text(
                                  WeatherCubit.get(context).weatherModel?.country ?? "not found",
                                  style: TextStyle(
                                    color: defaultColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                                const SizedBox(
                                  height: 70,
                                ),
                                titleText("${WeatherCubit.get(context).weatherModel?.weatherTemp}",),
                                const SizedBox(height: 15,),
                                titleText(WeatherCubit.get(context).weatherModel?.condition ?? "not found",),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
            );
          },
        )
    );
  }
}
