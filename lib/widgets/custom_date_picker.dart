import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    super.key,
    required this.dateController,
    this.width = double.infinity,
    this.height = 50,
    this.hint = "Enter your birthdate",
    this.outlineColor = Colors.black,
    this.outlineWidth = 2.0,
    this.textColor = wightColor,
    this.hintColor = wightColor
  });

  final TextEditingController dateController;
  final double width;
  final double height;
  final String hint;
  final Color outlineColor;
  final double outlineWidth;
  final Color textColor;
  final Color hintColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        enableInteractiveSelection: false,
        controller: dateController,
        keyboardType: TextInputType.none,
        style: TextStyle(
          color: textColor,
        ),
        cursorColor: secondColor,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: hintColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: outlineColor,
              width: 5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: secondColor,
              width: outlineWidth,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: defaultColor.withOpacity(.5),
              width: outlineWidth,
            ),
          ),
        ),
        onTap: () {
          showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.parse('2025-12-30'),
          ).then((value) {
            if (value != null) {
              dateController.text = DateFormat('yyyy-MM-dd').format(value);
            }
          });
        },
      ),
    );
  }
}
