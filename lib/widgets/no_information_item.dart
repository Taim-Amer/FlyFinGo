import 'package:flutter/material.dart';
import 'package:travelt/shared/styles/themes.dart';

Widget buildNoInformationItem({required String message ,required String imageUrl}) => Center(
  child: SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          fit: BoxFit.fitWidth,
          image: AssetImage(
            imageUrl,
          ),
        ),
        const SizedBox(height: 30,),
        Text(
          message,
          style: TextStyle(
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              fontSize: 20,
              color: defaultColor
          ),
        ),
      ],
    ),
  ),
);