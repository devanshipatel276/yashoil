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
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.orangeAppBarColor,
        centerTitle: true,
        titleTextStyle: AppStyles.boldStyle.copyWith(
            color: AppColors.whiteTextColor, fontSize: Dimens.fontSize16),
        actionsIconTheme:
            const IconThemeData(color: AppColors.primaryWhiteColor),
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
      ),
      colorScheme: appColorScheme,
      backgroundColor: appColorScheme.background,
      splashColor: appColorScheme.primary.withOpacity(0.14),
      indicatorColor: appColorScheme.primary,
      iconTheme: const IconThemeData(color: AppColors.whiteBackGroundColor),
      scaffoldBackgroundColor: appColorScheme.background,
      buttonTheme: ButtonThemeData(
        buttonColor: appColorScheme.secondary,
        disabledColor: AppColors.lightPurpleBackGroundColor,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        colorScheme: appColorScheme,
        textTheme: ButtonTextTheme.primary,
        splashColor: appColorScheme.primary.withOpacity(0.14),
        shape: RoundedRectangleBorder(
            borderRadius: 0.borderRadius,
            side: BorderSide(color: appColorScheme.onSecondary)),
      ),
      textButtonTheme: TextButtonThemeData(
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
          textStyle: MaterialStateProperty.resolveWith<TextStyle>((_) =>
              AppStyles.button.copyWith(color: appColorScheme.secondary)),
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
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 3,
        ),
        prefixStyle: AppStyles.textRegular,
        hintStyle: AppStyles.textRegular,
        labelStyle: AppStyles.textRegular,
        enabledBorder: 8.outlineInputBorder(
          borderSide: 1.5.borderSide(color: AppColors.primaryWhiteColor),
        ),
        focusedBorder: 8.outlineInputBorder(
          borderSide: 1.5.borderSide(color: AppColors.primaryWhiteColor),
        ),
        border: 8.outlineInputBorder(
          borderSide: 1.5.borderSide(color: AppColors.primaryWhiteColor),
        ),
        focusColor: AppColors.primaryWhiteColor,
        hoverColor: AppColors.primaryWhiteColor,
        errorStyle: AppStyles.textRegular,
        iconColor: AppColors.primaryWhiteColor,
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        floatingLabelStyle: AppStyles.textRegular,
        errorBorder: 8.outlineInputBorder(
          borderSide: 1.5.borderSide(color: AppColors.redErrorColor),
        ),
        focusedErrorBorder: 8.outlineInputBorder(
          borderSide: 1.5.borderSide(color: AppColors.redErrorColor),
        ),
        disabledBorder: 4.outlineInputBorder(
          borderSide: 1.5.borderSide(color: AppColors.primaryWhiteColor),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
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
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
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
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 4,
        backgroundColor: appColorScheme.secondary,
        shape: RoundedRectangleBorder(borderRadius: 20.borderRadius),
        disabledElevation: 0,
        extendedIconLabelSpacing: 10,
        splashColor: appColorScheme.onPrimary.withOpacity(0.14),
      ),
      cardTheme: CardTheme(
        color: appColorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: 1.borderRadius,
        ),
        shadowColor: appColorScheme.shadow,
        elevation: 2,
      ),
      dialogTheme: DialogTheme(
          backgroundColor: AppColors.whiteAppBarColor,
          shape: RoundedRectangleBorder(
            borderRadius: 2.borderRadius,
          ),
          elevation: 2,
          titleTextStyle:
              AppStyles.regularStyle.copyWith(color: AppColors.orangeTextColor),
          contentTextStyle: AppStyles.regularStyle
              .copyWith(color: appColorScheme.onBackground)),
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: appColorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0.r),
              topRight: Radius.circular(0.r),
            ),
          ),
          modalBackgroundColor: appColorScheme.background,
          elevation: 2,
          modalElevation: 2),
      navigationBarTheme: NavigationBarThemeData(
          surfaceTintColor: AppColors.mediumPurpleBackGroundColor,
          backgroundColor: AppColors.mediumPurpleBackGroundColor,
          indicatorColor: AppColors.whiteBackGroundColor.withOpacity(0.6)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 2,
        backgroundColor: AppColors.mediumPurpleBackGroundColor,
        selectedIconTheme: const IconThemeData(
            color: AppColors.purpleBackGroundColor, size: 20),
        selectedItemColor: AppColors.purpleTextColor,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        unselectedIconTheme:
            const IconThemeData(color: AppColors.primaryWhiteColor, size: 20),
        unselectedItemColor: AppColors.whiteTextColor,
        selectedLabelStyle: AppStyles.textExtraSmall,
        unselectedLabelStyle: AppStyles.textExtraSmall,
      ),
      dividerColor: appColorScheme.outline,
      drawerTheme: DrawerThemeData(
        backgroundColor: appColorScheme.background,
        elevation: 2,
        scrimColor: Colors.black.withOpacity(0.8),
      ),
      // toggleButtonsTheme
      // :,
      // timePickerTheme
      // :,
      tabBarTheme: TabBarTheme(
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
      ),
      switchTheme: SwitchThemeData(
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
      ),
      snackBarTheme: SnackBarThemeData(
        shape: RoundedRectangleBorder(borderRadius: 5.borderRadius),
        backgroundColor: appColorScheme.onBackground,
        actionTextColor: appColorScheme.background,
        contentTextStyle:
            AppStyles.regularStyle.copyWith(color: appColorScheme.background),
      ),
      // sliderTheme
      // :,
      radioTheme: RadioThemeData(
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
      ),
      checkboxTheme: CheckboxThemeData(
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
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        circularTrackColor: Colors.transparent,
        color: appColorScheme.primary,
        linearMinHeight: 3,
        linearTrackColor: Colors.transparent,
      ),
      popupMenuTheme: PopupMenuThemeData(
          color: appColorScheme.surface,
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: 2.borderRadius),
          textStyle: AppStyles.regularStyle),
      useMaterial3: false,
    );
  }

  static OutlinedButtonThemeData getBlackOutlinedButton() {
    return OutlinedButtonThemeData(
      style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return appColorScheme.onSecondary.withOpacity(0.14);
              }

              return null;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
              (states) => appColorScheme.onBackground),
          textStyle: MaterialStateProperty.resolveWith<TextStyle>((_) =>
              AppStyles.regularStyle
                  .copyWith(color: AppColors.secondaryPurpleColor)),
          shadowColor: MaterialStateProperty.resolveWith((states) {
            if (!states.contains(MaterialState.disabled)) {
              return appColorScheme.shadow;
            }
            return null;
          }),
          side: MaterialStateProperty.resolveWith<BorderSide>(
            (states) => 1.borderSide(color: appColorScheme.onSecondary),
          ),
          shape: MaterialStateProperty.resolveWith((states) =>
              RoundedRectangleBorder(borderRadius: 8.borderRadius))),
    );
  }
}
