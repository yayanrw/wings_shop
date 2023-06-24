import 'package:flutter/material.dart';
import 'package:wings_shop/core/config/constants.dart';
import 'package:wings_shop/core/theme/my_colors.dart';

InputDecorationTheme myInputDecorationTheme() {
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    labelStyle: TextStyle(color: MyColors.primaryDark),
    contentPadding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(defaultRadius),
      borderSide: BorderSide(color: MyColors.primaryDark),
      gapPadding: 10,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(defaultRadius),
      borderSide: BorderSide(color: MyColors.primaryDark),
      gapPadding: 10,
    ),
  );
}