import 'package:flutter/material.dart';
import 'package:wings_shop/core/theme/my_colors.dart';

TextTheme myTextTheme({Color? color, FontWeight? fontWeight}) {
  final Color newColor = color ?? MyColors.textWhite;

  return TextTheme(
    headlineLarge: TextStyle(
      fontSize: 40,
      fontWeight: fontWeight ?? FontWeight.w700,
      fontStyle: FontStyle.normal,
      height: 1.5,
      color: newColor,
    ),
    titleLarge: TextStyle(
      fontSize: 29,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: 1.5,
      color: newColor,
    ),
    titleMedium: TextStyle(
      fontSize: 19,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: 1.5,
      color: newColor,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: 1.5,
      color: newColor,
    ),
    labelMedium: TextStyle(
      fontSize: 14,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: 0,
      color: newColor,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontStyle: FontStyle.normal,
      height: 0,
      color: newColor,
    ),
  );
}
