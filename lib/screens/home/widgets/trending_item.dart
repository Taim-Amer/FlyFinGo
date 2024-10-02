import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/screens/details_page.dart';
import 'package:travelt/widgets/navigate_items.dart';

Widget buildTrendingItem(double height , double width , context) => GestureDetector(
  onTap: (){
    navigateTo(context, const DetailsPage());
  },
  child: ClipRRect(
    borderRadius: BorderRadius.circular(20),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image.asset(
          "assets/images/Dubai.jpg",
          fit: BoxFit.fill,
          color: wightColor.withOpacity(0.8),
          colorBlendMode: BlendMode.dstATop,
        ),
        ),
  ),
);