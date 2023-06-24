import 'package:flutter/material.dart';
import 'package:wings_shop/core/theme/my_colors.dart';

ElevatedButtonThemeData myElevatedButtonThemeData() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(MyColors.primary),
      padding: MaterialStateProperty.all<EdgeInsets>(
        const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(fontSize: 18),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    ),
  );
}

TextButtonThemeData myTextButtonThemeData() {
  return TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(MyColors.primaryDark),
    ),
  );
}