import 'package:flutter/material.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';

class CustomFilterItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onSelected;

  const CustomFilterItem({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: ChoiceChip(
        label: Text(label),
        backgroundColor: wightGreyColor,
        selected: isSelected,
        onSelected: (_) => onSelected(),
        elevation: isSelected ? 4 : 0,
        selectedColor: defaultColor.withOpacity(.7),
        labelStyle: TextStyle(
          color: isSelected ? wightColor : defaultColor,
        ),
      ),
    );
  }
}
