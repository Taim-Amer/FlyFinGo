import 'package:flutter/material.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/widgets/text_items.dart';

class CustomHomeCirclarWidget extends StatelessWidget {
  const CustomHomeCirclarWidget({super.key, required this.function, required this.icon, required this.title});

  final VoidCallback? function;
  final Icon icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: function,
          child: CircleAvatar(
            backgroundColor: wightGreyColor.withOpacity(.5),
            radius: 30,
            child: icon
          ),
        ),
        detailsText(title, size: 15)
      ],
    );
  }
}
