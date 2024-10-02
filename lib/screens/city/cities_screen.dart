import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/screens/city/cubit/city_cubit.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/screens/home/widgets/custom_city_details.dart';
import 'package:travelt/widgets/custom_loading_widget.dart';
import 'package:travelt/widgets/custom_staggered_list_animation.dart';

class CitiesScreen extends StatelessWidget {
  const CitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

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
      child: BlocProvider(
        create: (context) => CityCubit()..getCities(),
        child: BlocBuilder<CityCubit, CityState>(
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    automaticallyImplyLeading: false,
                  ),
                  body: ConditionalBuilder(
                    condition: state is! CitiesLoadingState,
                    builder: (context) {
                      return SizedBox(
                        height: size.height * .85,
                        child: CustomStaggeredListAnimation(
                          widgetBuilder: (int index) {
                            var city = CityCubit.get(context).cityModel?.city![index];
                            return Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: CustomCityDetails(
                                height: size.height * 0.6,
                                width: size.width * 0.9,
                                cityName: city!.name!,
                                description: city.population!,
                                lat: city.latitude!,
                                long: city.longitude!,
                                function: () {},
                              ),
                            );
                          },
                          count: CityCubit.get(context).cityModel?.city!.length ?? 1,
                        ),
                      );
                    },
                    fallback: (context) => Center(
                      child: CustomLoadingWidget(),
                    ),
                  ),
              ),
            );
          },
        ),
      ),
    );
  }
}
