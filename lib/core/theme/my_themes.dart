import 'package:flutter/material.dart';
import 'package:wings_shop/core/config/constants.dart';
import 'package:wings_shop/core/theme/my_colors.dart';
import 'package:wings_shop/core/theme/my_input_decoration_theme.dart';
import 'package:wings_shop/core/theme/my_text_selection_theme_data.dart';
import 'package:wings_shop/core/theme/my_text_theme.dart';

ThemeData myThemes() {
  return ThemeData(
    scaffoldBackgroundColor: MyColors.bgScaffoldBackground,
    primaryColor: MyColors.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: MyColors.primary,
      primary: MyColors.primary,
      secondary: MyColors.primary,
    ),
    fontFamily: fontFamily,
    inputDecorationTheme: myInputDecorationTheme(),
    textTheme: myTextTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textSelectionTheme: myTextSelectionThemeData(),
  );
}
