import 'package:flutter/material.dart';
import 'package:route_project/app_colors.dart';

class MyTheme {
  static ThemeData mainTheme = ThemeData(
    primaryColor: Appcolors.primaryColor,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Appcolors.primaryColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: Appcolors.greyColor,
      ),
    ),
  );
}
