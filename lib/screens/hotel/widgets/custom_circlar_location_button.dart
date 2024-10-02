import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travelt/screens/map_screen.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/widgets/navigate_items.dart';

class CustomCirclarLocationButton extends StatelessWidget {
  const CustomCirclarLocationButton({super.key, required this.lat, required this.long});

  final double lat;
  final double long;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: (){
        navigateWithFade(context, MapScreen(lat: lat, long: long));
      },
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.blueAccent.withOpacity(.5),
        child: const Icon(
          Iconsax.location,
          color: wightColor,
        ),
      ),
    );
  }
}
