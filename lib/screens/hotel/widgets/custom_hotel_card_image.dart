import 'package:flutter/material.dart';
import 'package:travelt/shared/styles/colors.dart';

class CustomHotelCardImage extends StatelessWidget {
  const CustomHotelCardImage({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .90,
      height: size.height * .70,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
              textColor.withOpacity(0.5),
              BlendMode.dstATop,
            ),
            image: const AssetImage("assets/images/hotel_background.jpg")),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: textColor.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: widget,
    );
  }
}