

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travelt/shared/styles/colors.dart';

class CustomCarouselItem extends StatelessWidget {
  const CustomCarouselItem({super.key, required this.imageUrl});

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Container(
          height: 190,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                imageUrl ,
              ),
              colorFilter: ColorFilter.mode(
                wightGreyColor.withOpacity(0.7),
                BlendMode.dstATop,
              ),
            ),
            color: Colors.transparent.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ],
      options: CarouselOptions(
        height: 200,
        initialPage: 0,
        viewportFraction: 1.0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(seconds: 2),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.vertical,
      ),
    );
  }
}
