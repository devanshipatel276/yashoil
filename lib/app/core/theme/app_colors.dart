import 'package:flutter/material.dart';

abstract class AppColors {
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  static const Color primaryColor = Color(0xFF054ECB);
  static const Color primaryDarkColor = Color(0xFF042B8E);
  static const Color statusBarColor = Color(0xFF033593);
  static const Color appBarColor = Color(0xFF0773CE);
  static const Color appBarIconColor = Color(0xFFFFFFFF);
  static const Color appBarTextColor = Color(0xFFFFFFFF);

  static const Color whiteGrayColor = Color(0xFFF9F9FD);
  static const Color darkGrayColor = Color(0xFF666666);

  static const Color blue = Color(0xFF30A0E5);
  static const Color red = Color(0xFFFF0000);
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color pageBg = Color(0xFFFAFBFD);

  static const Color defaultRippleColor = Color(0x0338686A);

  static const Color shrinePink50 = Color(0xFFFEEAE6);
  static const Color shrinePink100 = Color(0xFFFEDBD0);
  static const Color shrinePink300 = Color(0xFFFBB8AC);
  static const Color /* shrinePink400 */ kPrimaryColor = Color(0xFFEAA4A4);

  static const Color shrineBrown900 = Color(0xFF442B2D);
  static const Color shrineBrown600 = Color(0xFF7D4F52);

  static const Color shrineErrorRed = Color(0xFFC5032B);

  static const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
  static const Color shrineBackgroundWhite = Colors.white;

  static const defaultLetterSpacing = 0.03;

  static final MaterialColor materialWhite = createMaterialColor(Colors.white);
  static final MaterialColor materialBlack = createMaterialColor(Colors.black);

  static final MaterialColor primary = createMaterialColor(Colors.blue.shade900);
  static final MaterialColor primaryContainer = createMaterialColor(Colors.blue.shade200);
  static final MaterialColor onPrimaryContainer = createMaterialColor(Colors.blue.shade800);
  static final MaterialColor onPrimary = materialWhite;
  static final MaterialColor secondary = createMaterialColor(Colors.blueGrey.shade700);
  static final MaterialColor onSecondary = materialWhite;
  static final MaterialColor onSecondaryContainer = createMaterialColor(materialBlack.shade200);
  static final MaterialColor secondaryContainer = createMaterialColor(Colors.blue.shade100);
  static final MaterialColor error = createMaterialColor(Colors.redAccent.shade400);
  static final MaterialColor onError = materialWhite;
  static final MaterialColor errorContainer = createMaterialColor(Colors.redAccent.shade100);
  static final MaterialColor onErrorContainer = createMaterialColor(Colors.red.shade900);
  static final MaterialColor background = materialWhite;
  static final MaterialColor onBackground = createMaterialColor(materialBlack.shade200);
  static final MaterialColor surface = materialWhite;
  static final MaterialColor onSurface = createMaterialColor(materialBlack.shade400);
  static final MaterialColor surfaceVariant = createMaterialColor(Colors.blueGrey.shade200);
  static final MaterialColor onSurfaceVariant = createMaterialColor(Colors.grey.shade800);
  static final MaterialColor outline = createMaterialColor(Colors.grey.shade600);
  static final MaterialColor shadow = materialBlack;
  static final MaterialColor inversePrimary = createMaterialColor(Colors.lightBlue.shade200);
  static final MaterialColor inverseSurface = createMaterialColor(materialBlack.shade200);
  static final MaterialColor onInverseSurface = createMaterialColor(Colors.white70);
}
