import 'dart:ui';

class MyColors {
  static Color bgScaffoldBackground = const Color(0xfff1f1f5);
  static Color bgWhiteSmooth = const Color(0xfffbfbfb);
  static Color dark = const Color(0xff000000);
  static Color error = const Color(0xffff0000);
  static Color info = const Color(0xff0000ff);
  static Color light = const Color(0xffffffff);
  static Color primary = HexColor('#FDBD10');
  static Color primaryDisabled = const Color(0xFFC69E07);
  static Color primaryDark = HexColor('#FC9D0A');
  static Color primaryLight = HexColor('#fed250');
  static Color primarySmooth = const Color(0xFFFFECDF);
  static Color purple = const Color(0xFF4A3298);
  static Color secondary = HexColor('#141414');
  static Color secondary2 = const Color(0xFF343434);
  static Color secondaryLight = const Color(0xFFD8D8D8);
  static Color secondaryLight2 = const Color(0xFF979797);
  static Color success = const Color(0xff00ff00);
  static Color textBlack = const Color(0xff222222);
  static Color textGrey = const Color(0xff94959b);
  static Color textWhiteGrey = const Color(0xfff1f1f5);
  static Color warning = const Color(0xffffff00);
  static Color white = const Color(0xffffffff);
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    String newHexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (newHexColor.length == 6) {
      newHexColor = 'FF$newHexColor';
    }
    return int.parse(newHexColor, radix: 16);
  }
}