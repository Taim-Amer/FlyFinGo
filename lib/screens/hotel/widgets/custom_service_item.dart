import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/text_items.dart';

class CustomServiceItem extends StatelessWidget {
  const CustomServiceItem({super.key, required this.serviceName});

  final String serviceName;
  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: wightGreyColor,
      side: BorderSide(
          color: defaultColor,
          width: 1
      ),
      label: Shimmer.fromColors(
        period: const Duration(seconds: 2),
        baseColor: defaultColor,
        highlightColor: Colors.amber,
        child: detailsText(
              serviceName,
            size: 15 ,
            color: defaultColor,
        ),
      ),
    );
  }
}
