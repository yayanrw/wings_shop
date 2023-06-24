import 'package:flutter/material.dart';
import 'package:wings_shop/core/config/constants.dart';
import 'package:wings_shop/core/theme/my_colors.dart';
import 'package:wings_shop/core/theme/my_input_decoration_theme.dart';
import 'package:wings_shop/core/theme/my_text_selection_theme_data.dart';
import 'package:wings_shop/core/theme/my_text_theme.dart';

ThemeData myThemes() {
  return ThemeData(
    scaffoldBackgroundColor: MyColors.bgScaffoldBackground,
    primaryColor: MyColors.orangeStartGradient,
    fontFamily: fontFamily,
    textTheme: myTextTheme(),
    inputDecorationTheme: myInputDecorationTheme(),
    textSelectionTheme: myTextSelectionThemeData(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
