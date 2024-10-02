import 'package:flutter/material.dart';
import 'package:travelt/shared/network/local/cache_helper.dart';
import 'package:travelt/shared/styles/colors.dart';

int? themeIndex ;
Future<void> setTheme(int themeIndex) async{
  switch(themeIndex){
    case 0:
      await CacheHelper.saveData(key: "Theme", value: 0);
      break;
    case 1:
      await CacheHelper.saveData(key: "Theme", value: 1);
      break;
    case 2:
      await CacheHelper.saveData(key: "Theme", value: 2);
      break;
    case 3:
      await CacheHelper.saveData(key: "Theme", value: 3);
      break;
    case 4:
      await CacheHelper.saveData(key: "Theme", value: 4);
    case 5:
      await CacheHelper.saveData(key: "Theme", value: 5);
  }
}

int getTheme(){
  return CacheHelper.getData(key: "Theme");
}

Color defaultColor = defaultSkyColor;
Future<Color> getDefaultColor() async{
  int themeIndex = await CacheHelper.getData(key: "Theme");
  if(themeIndex == 0){
    defaultColor = defaultSkyColor;

  }else if(themeIndex == 1){
    defaultColor = defaultForestColor;

  }else if(themeIndex == 2){
    defaultColor = defaultClassicColor;

  }else if(themeIndex == 3){
    defaultColor = defaultAutumnColor;
  }else if(themeIndex == 4){
    defaultColor = defaultPinkColor;
  }else if(themeIndex == 5){
    defaultColor = defaultBlackColor;
  }
  return defaultColor;
}

Color secondColor = secondSkyColor;
Future<Color> getSecondColor() async{
  secondColor ??= secondSkyColor;
  int themeIndex = await CacheHelper.getData(key: "Theme");
  if(themeIndex == 0){
    secondColor = secondSkyColor;

  }else if(themeIndex == 1){
    secondColor = secondForestColor;

  }else if(themeIndex == 2){
    secondColor = secondClassicColor;

  }else if(themeIndex == 3){
    secondColor = secondAutumnColor;
  }else if(themeIndex == 4){
    secondColor = secondPinkColor;
  }else if(themeIndex == 5){
    secondColor = secondBlackColor;
  }
  return secondColor;
}