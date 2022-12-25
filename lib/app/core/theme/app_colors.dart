import 'package:flutter/cupertino.dart';
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

  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF000000);
  static const Color yellowColor = Color(0xFFFFB300);
  static const Color darkGrayColor = Color(0xFF757575);
  static const Color ultraDarkGrayColor = Color(0xFF4D4D4D);
  static const Color mediumGrayColor = Color(0xFFC2C8C8);
  static const Color orangeColor = Color(0xFFFD4F57);
  static const Color redColor = Color(0xFFD6273D);
  static const Color lightRedColor = Color(0xFFFFADA6);
  static const Color greenColor = Color(0xFF1DCA7F);
  static const Color blueColor = Color(0xFF3665FF);
  static const Color lightBlueColor = Color(0xFF007AFF);
  static const Color purpleColor = Color(0xFF6C2FB6);
  static const Color mediumPurpleColor = Color(0xFF843ADD);
  static const Color lightPurpleColor = Color(0xFF9F71DE);
  static const Color ultraLightPurpleColor = Color(0xFFE1D2F0);
  static const Color extraLightPurpleColor = Color(0xFFF2E8F9);
  static const Color playlistPurpleColor = Color(0xFFC3A5E1);
  static const Color extraLightRed = Color(0xFFFFD6D1);

  //text colors
  static const Color whiteTextColor = whiteColor;
  static const Color blackTextColor = blackColor;
  static const Color redTextColor = redColor;
  static const Color orangeTextColor = orangeColor;
  static const Color purpleTextColor = mediumPurpleColor;
  static const Color grayTextColor = ultraDarkGrayColor;
  static const Color lightGrayTextColor = darkGrayColor;
  static const Color dialogTextColor = CupertinoColors.activeBlue;

  //appbar colors
  static const Color purpleAppBarColor = lightPurpleColor;
  static const Color orangeAppBarColor = orangeColor;
  static const Color greenAppBarColor = greenColor;
  static const Color blueAppBarColor = blueColor;
  static const Color whiteAppBarColor = whiteColor;

  //background colors
  static const Color blueBackGroundColor = blueColor;
  static const Color lightBlueBackGroundColor = lightBlueColor;
  static const Color greenBackGroundColor = greenColor;
  static const Color orangeBackGroundColor = orangeColor;
  static const Color lightPurpleBackGroundColor = extraLightPurpleColor;
  static const Color mediumPurpleBackGroundColor = lightPurpleColor;
  static const Color purpleBackGroundColor = purpleColor;
  static const Color whiteBackGroundColor = whiteColor;
  static const Color lightGrayBackGroundColor = mediumGrayColor;
  static const Color lightRedBackGroundColor = lightRedColor;
  static const Color dialogBackGroundColor = CupertinoColors.black;
  static const Color grayBackGroundColor = ultraDarkGrayColor;
  static const Color blackBackGroundColor = blackColor;
  static const Color yellowBackGroundColor = yellowColor;
  static const Color redBackGroundColor = redColor;
  static const Color ultraLightPurpleBackGroundColor = ultraLightPurpleColor;

  //primary,secondary colors
  static const Color primaryWhiteColor = whiteColor;
  static const Color primaryGrayColor = ultraDarkGrayColor;
  static const Color primaryOrangeColor = orangeColor;
  static const Color secondaryPurpleColor = lightPurpleColor;
  static const Color secondaryLightPurpleColor = ultraLightPurpleColor;

  static const Color transparent = Colors.transparent;
  static const Color redErrorColor = lightRedColor;
  static const Color lyricsColor = yellowColor;
  static const Color inactiveDotColor = Colors.white54;
}
