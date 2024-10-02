import 'package:flutter/material.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';

class CustomCirclarFavouriteButton extends StatelessWidget {
  CustomCirclarFavouriteButton({super.key, required this.icon, required this.function, this.isFavouite});

  final IconData icon;
  final VoidCallback function;
  bool? isFavouite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      splashColor: Colors.transparent,
      child: CircleAvatar(
        radius: 20,
        backgroundColor:
            isFavouite! ? Colors.redAccent.withOpacity(.7) : wightColor.withOpacity(.7),
        child: Icon(
          icon,
          color: isFavouite! ? wightColor : defaultColor,
        ),
      ),
    );
  }
}
