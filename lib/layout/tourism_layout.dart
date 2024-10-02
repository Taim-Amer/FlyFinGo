import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/layout/cubit/tourism_cubit.dart';
import 'package:travelt/shared/styles/themes.dart';

class TourismLayout extends StatelessWidget {
  const TourismLayout({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<TourismCubit , TourismState>(
        listener: (context , state){},
        builder: (context , state)
        {
          var cubit = TourismCubit.get(context);
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      titleColor,
                      wightColor,
                      secondColor,
                    ]
                )
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: cubit.bottomScreen[cubit.currentIndex],
              bottomNavigationBar: Container(
                  height: size.width * .155,
                  color: Colors.transparent,
                  child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: size.width * .14),
                    itemBuilder: (context , index) => InkWell(
                      onTap: () {
                        cubit.changeBottom(index);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(height: size.width * .014),
                          Icon(
                              cubit.icons[index],
                              size: size.width * .076,
                              color: defaultColor
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 1500),
                            curve: Curves.fastLinearToSlowEaseIn,
                            margin: EdgeInsets.only(
                              top: index == cubit.currentIndex ? 0 : size.width * .029,
                              right: size.width * .0422,
                              left: size.width * .0422,
                            ),
                            width: size.width * .153,
                            height: index == cubit.currentIndex ? size.width * .014 : 0,
                            decoration: BoxDecoration(
                              color: defaultColor,
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          );
        },
    );
  }
}
