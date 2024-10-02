import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travelt/layout/tourism_layout.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/navigate_items.dart';

class CustomStartButtonWidget extends StatelessWidget {
  const CustomStartButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        navigateWithSlideFromRight(context, const TourismLayout());
      },
      child: Stack(
        children: [
          Container(
            height: 45.0,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  defaultColor.withOpacity(.9),
                  defaultColor.withOpacity(.9),
                  secondColor,
                ],
              ),
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: defaultColor,
                width: 2.0,
              ),
            ),
            child: const Center(
              child: Text(
                  "START",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: wightColor, // Set text color
                  ),
                ),
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            height: 45.0,
            child: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white,
              period: const Duration(milliseconds: 1500),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.2),
                        Colors.white.withOpacity(0.4),
                        Colors.white.withOpacity(0.6),
                        Colors.white.withOpacity(0.8),
                      ],
                      stops: const [0.2, 0.5, 0.8, 1.0],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
