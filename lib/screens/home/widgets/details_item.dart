import 'package:flutter/material.dart';
import 'package:travelt/shared/styles/colors.dart';

Widget detailsItem(double width , double height , String imageUrl , Widget child) => Container(
  height: height,
  width: width,
  decoration: BoxDecoration(
    color: wightColor.withOpacity(.9),
    borderRadius: BorderRadius.circular(30),
    boxShadow: [
      BoxShadow(
        color: textColor.withOpacity(0.1),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3),
      ),
    ],
    image: DecorationImage(
      image: AssetImage(imageUrl),
      fit: BoxFit.cover,
      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: child
  ),
);