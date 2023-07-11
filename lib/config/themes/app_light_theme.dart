
import 'package:cookpedia/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

ThemeData appLightTheme() {
  return ThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColor.primaryColor
    ),
    textTheme:  TextTheme(
      displayMedium: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleMedium:TextStyle(
      fontSize: 14.sp,
      color: Colors.white,
      height: 1.5.sp,

    ),
    ),

  );
}
