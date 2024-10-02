import 'package:flutter/material.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
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
      child: widget,
    );
  }
}
