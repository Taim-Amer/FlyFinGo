import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/widgets/text_items.dart';


Widget buildThemeItem(Color color,Color color1, Color color2 ,Function function , String title , context)
{
  var size = MediaQuery.of(context).size;
  return Padding(
  padding: const EdgeInsets.only(left: 20.0 , right: 20),
  child: SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      children:
      [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child:  ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GestureDetector(
              onTap: (){
                function();
              },
              child: Stack(
                children:
                [
                  Container(
                    height: size.height *.13,
                    width: double.infinity ,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors:
                        [
                          wightGreyColor,
                          color1,
                          color2,
                        ]
                      ),
                      color: color1.withOpacity(.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Positioned(
                    top: 45,
                    left: 95,
                    child: subTitleText(
                        title,
                      color: color
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  ),
);
}