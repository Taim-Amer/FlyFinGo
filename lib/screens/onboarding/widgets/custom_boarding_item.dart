import 'package:flutter/material.dart';
import 'package:travelt/models/boarding_model.dart';
import 'package:travelt/widgets/text_items.dart';

class CustomBoardingItem extends StatelessWidget {
  const CustomBoardingItem({super.key, required this.boardingModel});

  final BoardingModel boardingModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image.asset(
            boardingModel.image,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        titleText(boardingModel.title),
        const SizedBox(
          height: 20,
        ),
        Text(
          boardingModel.body,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
