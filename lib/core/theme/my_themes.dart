import 'package:flutter/material.dart';
import 'package:wings_shop/core/config/constants.dart';
import 'package:wings_shop/core/theme/my_colors.dart';
import 'package:wings_shop/core/theme/my_text_theme.dart';

ThemeData myThemes() {
  return ThemeData(
    scaffoldBackgroundColor: MyColors.bgScaffoldBackground,
    primaryColor: MyColors.orangeStartGradient,
    fontFamily: fontFamily,
    textTheme: myTextTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
