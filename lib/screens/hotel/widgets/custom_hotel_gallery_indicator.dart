import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travelt/shared/styles/themes.dart';

class CustomHotelGalleryIndicator extends StatelessWidget {
  const CustomHotelGalleryIndicator({super.key, required this.controller});

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
        controller: controller,
        effect: WormEffect(
          type: WormType.thin,
          dotColor: Colors.grey,
          activeDotColor: defaultColor,
          dotHeight: 4,
          dotWidth: 40,
          spacing: 6,
        ),
        count: 3
    );
  }
}
