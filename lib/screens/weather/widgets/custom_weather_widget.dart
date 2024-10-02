import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelt/screens/weather/weather_search_screen.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/navigate_items.dart';
import 'package:travelt/widgets/text_items.dart';

class CustomWeather extends StatelessWidget {
  const CustomWeather({super.key, required this.width, required this.height, required this.context});

  final double width;
  final double height;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        navigateTo(context, WeatherSearchScreen());
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: height,
          width: width ,
          decoration: BoxDecoration(
            color: defaultColor.withOpacity(.6),
            image: const DecorationImage(
                colorFilter: ColorFilter.mode(wightGreyColor, BlendMode.dstATop),
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/weather1.jpg",
                )
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Container(
              width: width * .8,
              height: height *.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: wightColor.withOpacity(.4),
              ),
              child: Center(
                child: subTitleText(
                    "You can search for Weather Now!",
                    color: defaultColor.withOpacity(.8)
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
