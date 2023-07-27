import 'package:cookpedia/core/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

ThemeData appLightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(primary: AppColor.primaryColor),
    textTheme: TextTheme(
      displayMedium: TextStyle(
          fontSize: 32.sp, fontWeight: FontWeight.bold, color: Colors.white),
      titleLarge: TextStyle(
          fontSize: 24.sp, height: 1.1.sp, fontWeight: FontWeight.w500),
      titleMedium: TextStyle(
        fontSize: 14.sp,
        color: Colors.black,
        height: 1.5.sp,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400
      ),
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        )),
    sliderTheme: SliderThemeData(
      thumbShape: SliderComponentShape.noThumb,
      trackHeight: 9,
      overlayColor: Colors.green,
    ),
  );
}
