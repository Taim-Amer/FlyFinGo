import 'package:flutter/material.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/widgets/text_items.dart';

class CustomDrawerRowItem extends StatelessWidget {
  const CustomDrawerRowItem({super.key, required this.icon, required this.title, required this.function});

  final IconData icon;
  final String title;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: wightGreyColor,
      ),
      title: detailsText(title, color: wightGreyColor),
      // subtitle: ,
      onTap: function,
    );
  }
}
