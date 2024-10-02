// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travelt/shared/styles/colors.dart';
import 'package:travelt/shared/styles/themes.dart';

void showToast(String txt , ToastState state) =>  Fluttertoast.showToast(
    msg: txt,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastColor(state),
    textColor: wightColor,
    fontSize: 16.0
);

enum ToastState{SUCCESS , ERROR , WARNING}

Color chooseToastColor(ToastState state) {
  Color color ;
  switch(state)
  {
    case ToastState.SUCCESS:
      color = Colors.green.withOpacity(.8);
      break;
    case ToastState.ERROR:
      color = Colors.redAccent.withOpacity(.8);
      break;
    case ToastState.WARNING:
      color = Colors.orange.withOpacity(.8);
      break;
  }
  return color;
}