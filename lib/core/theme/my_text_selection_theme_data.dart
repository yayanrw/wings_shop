import 'package:flutter/material.dart';
import 'package:wings_shop/core/theme/my_colors.dart';

TextSelectionThemeData myTextSelectionThemeData() {
  return TextSelectionThemeData(
    cursorColor: MyColors.primaryDark,
    selectionColor: MyColors.primaryDark,
    selectionHandleColor: MyColors.primaryDark,
  );
}