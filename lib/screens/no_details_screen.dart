import 'package:flutter/material.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/widgets/text_items.dart';

class NoDetailsScreen extends StatelessWidget {
  const NoDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              secondColor,
              wightGreyColor,
              textColor,
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/bird.png"),
            titleText("No Items Yet")
          ],
        ),
      ),
    );
  }
}
