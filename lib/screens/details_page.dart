import 'package:flutter/material.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';
import 'package:travelt/screens/home/widgets/details_item.dart';
import 'package:travelt/widgets/text_items.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                secondColor,
                wightGreyColor,
              ]
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(left: 30 , right: 30 , bottom: 100 , top: 100),
          child: detailsItem(
              size.width,
              size.height,
              "assets/images/Dubai.jpg",
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:
                [
                  titleText("Dubai Tower"),
                  const Text(
                      "details details details details details details details details details",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: textColor,
                      fontStyle: FontStyle.italic,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
          ),
        )
      ),
    );
  }
}
