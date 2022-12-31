import 'package:flutter/services.dart';

import '../../../util/exports.dart';

abstract class MyAppTheme {
  static ColorScheme appColorScheme = const ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primaryWhiteColor,
    primaryContainer: AppColors.primaryOrangeColor,
    onPrimaryContainer: AppColors.primaryWhiteColor,
    onPrimary: AppColors.primaryWhiteColor,
    secondary: AppColors.secondaryPurpleColor,
    onSecondary: AppColors.secondaryPurpleColor,
    onSecondaryContainer: AppColors.secondaryPurpleColor,
    secondaryContainer: AppColors.secondaryPurpleColor,
    error: AppColors.redErrorColor,
    onError: AppColors.redErrorColor,
    errorContainer: AppColors.redErrorColor,
    onErrorContainer: AppColors.redErrorColor,
    background: AppColors.whiteBackGroundColor,
    onBackground: AppColors.whiteBackGroundColor,
    surface: AppColors.transparent,
    onSurface: AppColors.transparent,
    outline: AppColors.transparent,
    shadow: AppColors.transparent,
  );

  static ThemeData get theme {
    return ThemeData(
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      }),
      focusColor: AppColors.whiteBackGroundColor,
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: _appBarTheme(),
      colorScheme: appColorScheme,
      backgroundColor: appColorScheme.background,
      splashColor: appColorScheme.primary.withOpacity(0.14),
      indicatorColor: appColorScheme.primary,
      iconTheme: const IconThemeData(color: AppColors.whiteBackGroundColor),
      scaffoldBackgroundColor: appColorScheme.background,
      buttonTheme: _buttonTheme(),
      textButtonTheme: _textButtonTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      elevatedButtonTheme: _elevatedButtonTheme(),
      outlinedButtonTheme: _outLinedButtonTheme(),
      floatingActionButtonTheme: _floatingActionButtonTheme(),
      cardTheme: _cardTheme(),
      dialogTheme: _dialogTheme(),
      bottomSheetTheme: _bottomSheetTheme(),
      navigationBarTheme: NavigationBarThemeData(
          surfaceTintColor: AppColors.mediumPurpleBackGroundColor,
          backgroundColor: AppColors.mediumPurpleBackGroundColor,
          indicatorColor: AppColors.whiteBackGroundColor.withOpacity(0.6)),
      bottomNavigationBarTheme: _bottomNavigationBarTheme(),
      dividerColor: appColorScheme.outline,
      drawerTheme: DrawerThemeData(
        backgroundColor: appColorScheme.background,
        elevation: 2,
        scrimColor: Colors.black.withOpacity(0.8),
      ),
      tabBarTheme: _tabBarTheme(),
      switchTheme: _switchTheme(),
      snackBarTheme: _snackBarTheme(),
      radioTheme: _radioTheme(),
      checkboxTheme: _checkBoxTheme(),
      progressIndicatorTheme: _progressIndicatorTheme(),
      popupMenuTheme: _popUpMenuTheme(),
      useMaterial3: false,
    );
  }

  //handle appbar theme
  static AppBarTheme? _appBarTheme() {
    return AppBarTheme(
      backgroundColor: AppColors.orangeAppBarColor,
      centerTitle: true,
      titleTextStyle: AppStyles.boldStyle.copyWith(
          color: AppColors.whiteTextColor, fontSize: Dimens.fontSize16),
      actionsIconTheme: const IconThemeData(color: AppColors.primaryWhiteColor),
      iconTheme: const IconThemeData(
        color: AppColors.primaryWhiteColor,
      ),
      shadowColor: AppColors.lightGrayBackGroundColor,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
          systemStatusBarContrastEnforced: true,
          systemNavigationBarContrastEnforced: true),
    );
  }

  //handle button theme
  static _buttonTheme() {
    return ButtonThemeData(
      buttonColor: appColorScheme.secondary,
      disabledColor: AppColors.lightPurpleBackGroundColor,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      colorScheme: appColorScheme,
      textTheme: ButtonTextTheme.primary,
      splashColor: appColorScheme.primary.withOpacity(0.14),
      shape: RoundedRectangleBorder(
          borderRadius: 0.borderRadius,
          side: BorderSide(color: appColorScheme.onSecondary)),
    );
  }

  //handle text button theme
  static _textButtonTheme() {
    return TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return appColorScheme.primary.withOpacity(0.14);
            }

            return null;
          },
        ),
        shadowColor: MaterialStateProperty.resolveWith((states) {
          if (!states.contains(MaterialState.disabled)) {
            return appColorScheme.shadow;
          }
          return null;
        }),
        textStyle: MaterialStateProperty.resolveWith<TextStyle>(
            (_) => AppStyles.button.copyWith(color: appColorScheme.secondary)),
        shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
          (states) => RoundedRectangleBorder(
            borderRadius: 8.borderRadius,
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.transparent;
            }
            return null;
          },
        ),
      ),
    );
  }

  //handle input decoration theme
  static inputDecorationTheme({
    Color? fillColor,
    TextStyle? labelStyle,
    TextStyle? errorStyle,
    Color? borderColor,
    Color? errorBorderColor,
  }) {
    return InputDecorationTheme(
      filled: true,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 3,
      ),
      fillColor: fillColor,
      prefixStyle: AppStyles.textRegular,
      hintStyle: labelStyle ?? AppStyles.textRegular,
      labelStyle: labelStyle ?? AppStyles.textRegular,
      enabledBorder: 8.outlineInputBorder(
        borderSide:
            1.5.borderSide(color: borderColor ?? AppColors.primaryWhiteColor),
      ),
      focusedBorder: 8.outlineInputBorder(
        borderSide:
            1.5.borderSide(color: borderColor ?? AppColors.primaryWhiteColor),
      ),
      border: 8.outlineInputBorder(
        borderSide:
            1.5.borderSide(color: borderColor ?? AppColors.primaryWhiteColor),
      ),
      focusColor: borderColor ?? AppColors.primaryWhiteColor,
      hoverColor: borderColor ?? AppColors.primaryWhiteColor,
      errorStyle: errorStyle ??
          AppStyles.textRegular.copyWith(color: AppColors.lightRedTextColor),
      iconColor: borderColor ?? AppColors.primaryWhiteColor,
      alignLabelWithHint: true,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      floatingLabelStyle: labelStyle ?? AppStyles.textRegular,
      errorBorder: 8.outlineInputBorder(
        borderSide:
            1.5.borderSide(color: errorBorderColor ?? AppColors.redErrorColor),
      ),
      focusedErrorBorder: 8.outlineInputBorder(
        borderSide:
            1.5.borderSide(color: errorBorderColor ?? AppColors.redErrorColor),
      ),
      disabledBorder: 4.outlineInputBorder(
        borderSide:
            1.5.borderSide(color: borderColor ?? AppColors.primaryWhiteColor),
      ),
    );
  }

  //handle elevated button theme
  static _elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return AppColors.primaryGrayColor.withOpacity(0.14);
            }

            return null;
          },
        ),
        shadowColor: MaterialStateProperty.resolveWith((states) {
          if (!states.contains(MaterialState.disabled)) {
            return appColorScheme.shadow;
          }
          return null;
        }),
      ),
    );
  }

  //handle outline button theme
  static _outLinedButtonTheme() {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return appColorScheme.secondary.withOpacity(0.14);
              }

              return null;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
              (states) => appColorScheme.background),
          textStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (_) => AppStyles.textRegular),
          shadowColor: MaterialStateProperty.resolveWith((states) {
            if (!states.contains(MaterialState.disabled)) {
              return appColorScheme.shadow;
            }
            return null;
          }),
          side: MaterialStateProperty.resolveWith<BorderSide>(
            (states) => 1.borderSide(color: appColorScheme.secondary),
          ),
          shape: MaterialStateProperty.resolveWith((states) =>
              RoundedRectangleBorder(borderRadius: 0.borderRadius))),
    );
  }

  //handle floating action button theme
  static _floatingActionButtonTheme() {
    return FloatingActionButtonThemeData(
      elevation: 4,
      backgroundColor: appColorScheme.secondary,
      shape: RoundedRectangleBorder(borderRadius: 20.borderRadius),
      disabledElevation: 0,
      extendedIconLabelSpacing: 10,
      splashColor: appColorScheme.onPrimary.withOpacity(0.14),
    );
  }

  //handle card theme
  static _cardTheme() {
    return CardTheme(
      color: appColorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: 1.borderRadius,
      ),
      shadowColor: appColorScheme.shadow,
      elevation: 2,
    );
  }

  //handle dialog theme
  static _dialogTheme() {
    return DialogTheme(
        backgroundColor: AppColors.whiteAppBarColor,
        shape: RoundedRectangleBorder(
          borderRadius: 2.borderRadius,
        ),
        elevation: 2,
        titleTextStyle:
            AppStyles.regularStyle.copyWith(color: AppColors.orangeTextColor),
        contentTextStyle: AppStyles.regularStyle
            .copyWith(color: appColorScheme.onBackground));
  }

  //handle bottom sheet theme
  static _bottomSheetTheme() {
    return BottomSheetThemeData(
        backgroundColor: appColorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0.r),
            topRight: Radius.circular(0.r),
          ),
        ),
        modalBackgroundColor: appColorScheme.background,
        elevation: 2,
        modalElevation: 2);
  }

  //handle bottom sheet navigation bar theme
  static _bottomNavigationBarTheme() {
    return BottomNavigationBarThemeData(
      elevation: 2,
      backgroundColor: AppColors.mediumPurpleBackGroundColor,
      selectedIconTheme:
          const IconThemeData(color: AppColors.purpleBackGroundColor, size: 20),
      selectedItemColor: AppColors.purpleTextColor,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      unselectedIconTheme:
          const IconThemeData(color: AppColors.primaryWhiteColor, size: 20),
      unselectedItemColor: AppColors.whiteTextColor,
      selectedLabelStyle: AppStyles.textExtraSmall,
      unselectedLabelStyle: AppStyles.textExtraSmall,
    );
  }

  //handle tab bar theme
  static _tabBarTheme() {
    return TabBarTheme(
      overlayColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return appColorScheme.primary.withOpacity(0.14);
          }
          return null;
        },
      ),
      // you can give only one from indicator and indicatorSize (Not both)
      indicator: BoxDecoration(
          color: appColorScheme.primary,
          // you can only give one from shape and border (Not both)
          // shape: BoxShape.rectangle,
          borderRadius: 1.borderRadius,
          border: Border(
            bottom: 1.borderSide(color: appColorScheme.outline),
            top: 1.borderSide(color: appColorScheme.outline),
            right: 1.borderSide(color: appColorScheme.outline),
            left: 1.borderSide(color: appColorScheme.outline),
          )
          // gradient: LinearGradient(
          //   colors: [appColorScheme.primary],
          // ),
          ),
      // indicatorSize: TabBarIndicatorSize.,
      labelPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      labelColor: appColorScheme.onPrimary,
      unselectedLabelColor: appColorScheme.primary,
      labelStyle: AppStyles.mediumStyle,
      unselectedLabelStyle: AppStyles.mediumStyle,
    );
  }

  //handle switch theme
  static _switchTheme() {
    return SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith(
        (states) {
          // if (states.contains(MaterialState.pressed) || states.contains(MaterialState.selected)) {
          //   return appColorScheme.primary;
          // }
          return appColorScheme.background;
        },
      ),
      trackColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected) ||
              states.contains(MaterialState.pressed)) {
            return appColorScheme.primary;
          }

          return AppColors.primaryWhiteColor;
        },
      ),
      overlayColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return appColorScheme.primary.withOpacity(0.14);
          }
          return null;
        },
      ),
      splashRadius: 20,
    );
  }

  //handle snack bar theme
  static _snackBarTheme() {
    return SnackBarThemeData(
      shape: RoundedRectangleBorder(borderRadius: 5.borderRadius),
      backgroundColor: appColorScheme.onBackground,
      actionTextColor: appColorScheme.background,
      contentTextStyle:
          AppStyles.regularStyle.copyWith(color: appColorScheme.background),
    );
  }

  //handle radio theme
  static _radioTheme() {
    return RadioThemeData(
      overlayColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return AppColors.dialogBackGroundColor.withOpacity(0.14);
          }
          return null;
        },
      ),
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed) ||
            states.contains(MaterialState.selected)) {
          return AppColors.dialogBackGroundColor;
        }

        return AppColors.dialogBackGroundColor;
      }),
      splashRadius: 20,
    );
  }

  //handle check box theme
  static _checkBoxTheme() {
    return CheckboxThemeData(
      overlayColor: MaterialStateProperty.resolveWith(
        (states) {
          if (states.contains(MaterialState.pressed)) {
            return appColorScheme.primary.withOpacity(0.14);
          }
          return null;
        },
      ),
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.pressed) ||
            states.contains(MaterialState.selected)) {
          return appColorScheme.primary;
        }

        return AppColors.primaryWhiteColor;
      }),
      side: const BorderSide(
          color: AppColors.primaryWhiteColor,
          width: 1.5,
          style: BorderStyle.solid),
      shape: RoundedRectangleBorder(
          borderRadius: 2.borderRadius,
          side: 1.5.borderSide(color: AppColors.primaryWhiteColor)),
      checkColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected) ||
            states.contains(MaterialState.pressed)) {
          return appColorScheme.onPrimary;
        }
        return AppColors.primaryWhiteColor;
      }),
      splashRadius: 20,
    );
  }

  //handle progress indicator theme
  static _progressIndicatorTheme() {
    return ProgressIndicatorThemeData(
      circularTrackColor: Colors.transparent,
      color: appColorScheme.primary,
      linearMinHeight: 3,
      linearTrackColor: Colors.transparent,
    );
  }

  //handle popup menu theme
  static _popUpMenuTheme() {
    return PopupMenuThemeData(
        color: appColorScheme.surface,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: 2.borderRadius),
        textStyle: AppStyles.regularStyle);
  }
}
