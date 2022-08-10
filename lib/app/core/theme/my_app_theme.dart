import 'package:flutter/services.dart';

import '../../../util/exports.dart';


abstract class MyAppTheme {
  static final ColorScheme appColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    primaryContainer: AppColors.primaryContainer,
    onPrimaryContainer: AppColors.onPrimaryContainer,
    onPrimary: AppColors.onPrimary,
    secondary: AppColors.secondary,
    onSecondary: AppColors.onSecondary,
    onSecondaryContainer: AppColors.onSecondaryContainer,
    secondaryContainer: AppColors.secondaryContainer,
    error: AppColors.error,
    onError: AppColors.onError,
    errorContainer: AppColors.errorContainer,
    onErrorContainer: AppColors.onErrorContainer,
    background: AppColors.background,
    onBackground: AppColors.onBackground,
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
    surfaceVariant: AppColors.surfaceVariant,
    onSurfaceVariant: AppColors.onSurfaceVariant,
    outline: AppColors.outline,
    shadow: AppColors.shadow,
    inversePrimary: AppColors.inversePrimary,
    inverseSurface: AppColors.inverseSurface,
    onInverseSurface: AppColors.onInverseSurface,
  );

  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
        color: appColorScheme.primary,
        // backgroundColor: appColorScheme.background,
        actionsIconTheme: IconThemeData(color: appColorScheme.onPrimary, size: 24),
        // shadowColor: appColorScheme.shadow,
        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
        // ),
        iconTheme: IconThemeData(color: appColorScheme.onPrimary),
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarColor: appColorScheme.primaryContainer,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: appColorScheme.primaryContainer,
            systemNavigationBarDividerColor: appColorScheme.onPrimaryContainer,
            systemNavigationBarIconBrightness: Brightness.light,
            systemStatusBarContrastEnforced: true,
            systemNavigationBarContrastEnforced: true),
      ),
      primaryTextTheme: AppStyles.textTheme,
      colorScheme: appColorScheme,
      backgroundColor: appColorScheme.background,
      splashColor: appColorScheme.primary.withOpacity(0.14),
      indicatorColor: appColorScheme.primary,
      iconTheme: IconThemeData(color: appColorScheme.onBackground),
      scaffoldBackgroundColor: appColorScheme.background,
      buttonTheme: ButtonThemeData(
        buttonColor: appColorScheme.secondary,
        disabledColor: appColorScheme.outline,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        colorScheme: appColorScheme,
        textTheme: ButtonTextTheme.primary,
        splashColor: appColorScheme.primary.withOpacity(0.14),
        shape:
            RoundedRectangleBorder(borderRadius: 10.borderRadius, side: BorderSide(color: appColorScheme.onSecondary)),
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
          textStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (_) => AppStyles.buttonTextStyle.copyWith(color: appColorScheme.secondary)),
          shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
            (states) => RoundedRectangleBorder(
              borderRadius: 5.borderRadius,
            ),
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return appColorScheme.outline;
              }
              return null;
            },
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return appColorScheme.primary.withOpacity(0.14);
              }

              return null;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith((states) => appColorScheme.secondary),
          textStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (_) => AppStyles.buttonTextStyle.copyWith(color: appColorScheme.onSecondary)),
          shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
            (states) => RoundedRectangleBorder(
              borderRadius: 5.borderRadius,
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return appColorScheme.primary.withOpacity(0.14);
              }

              return null;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith((states) => appColorScheme.background),
          textStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (_) => AppStyles.buttonTextStyle.copyWith(color: appColorScheme.secondary)),
          shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
            (states) => RoundedRectangleBorder(
                borderRadius: 5.borderRadius,
                side: BorderSide(color: appColorScheme.secondary, style: BorderStyle.solid, width: 50)),
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 4,
        backgroundColor: appColorScheme.secondary,
        shape: RoundedRectangleBorder(borderRadius: 20.borderRadius),
        disabledElevation: 0,
        extendedIconLabelSpacing: 10,
        splashColor: appColorScheme.primary.withOpacity(0.14),
      ),
      textTheme: AppStyles.textTheme,
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 3,
        ),
        prefixStyle: AppStyles.body2,
        hintStyle: AppStyles.hintStyle.copyWith(color: Colors.grey.shade400),
        labelStyle: AppStyles.hintStyle.copyWith(color: Colors.grey.shade400),

        // enabledBorder: 10.outlineInputBorder(
        //   borderSide: 1.borderSide(color: appColorScheme.outline),
        // ),
        focusedBorder: 10.outlineInputBorder(
          borderSide: 1.borderSide(color: appColorScheme.onPrimaryContainer),
        ),
        border: 10.outlineInputBorder(
          borderSide: 1.borderSide(color: appColorScheme.outline),
        ),
        focusColor: appColorScheme.onPrimaryContainer,
        hoverColor: Colors.transparent,
        errorStyle: AppStyles.errorStyle,
        // alignLabelWithHint: true,
        floatingLabelStyle: AppStyles.hintStyle.copyWith(color: Colors.grey.shade600),
        errorBorder: 10.outlineInputBorder(
          borderSide: 1.borderSide(color: appColorScheme.error),
        ),
        focusedErrorBorder: 10.outlineInputBorder(
          borderSide: 1.borderSide(color: appColorScheme.error),
        ),
        disabledBorder: 10.outlineInputBorder(
          borderSide: 1.borderSide(color: appColorScheme.outline.withOpacity(0.5)),
        ),
      ),
      cardTheme: CardTheme(
        color: appColorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: 10.borderRadius,
        ),
        shadowColor: appColorScheme.shadow,
        elevation: 5,
      ),
      dialogTheme: DialogTheme(
          backgroundColor: appColorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: 20.borderRadius,
          ),
          elevation: 5,
          titleTextStyle: AppStyles.pageTitleStyle.copyWith(color: appColorScheme.onPrimaryContainer),
          contentTextStyle: AppStyles.body2.copyWith(color: appColorScheme.onBackground)),
      bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: appColorScheme.background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(23.r),
              topRight: Radius.circular(23.r),
            ),
          ),
          modalBackgroundColor: appColorScheme.background,
          elevation: 5,
          modalElevation: 5),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 5,
        backgroundColor: appColorScheme.background,
        selectedIconTheme: IconThemeData(color: appColorScheme.primary, size: 28),
        selectedItemColor: appColorScheme.primary,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        unselectedIconTheme: IconThemeData(color: appColorScheme.secondary),
        unselectedItemColor: appColorScheme.secondary,
        selectedLabelStyle: AppStyles.mediumStyle,
        unselectedLabelStyle: AppStyles.regularStyle,
      ),
      dividerColor: appColorScheme.outline,
      drawerTheme: DrawerThemeData(
        backgroundColor: appColorScheme.background,
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
        // indicator: BoxDecoration(
        //     color: appColorScheme.primary,
        //     shape: BoxShape.rectangle,
        //     borderRadius: 2.borderRadius,
        //     gradient: LinearGradient(colors: [appColorScheme.primary])),
        indicatorSize: TabBarIndicatorSize.tab,
        labelPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        labelColor: appColorScheme.primary,
        unselectedLabelColor: appColorScheme.secondary,
        labelStyle: AppStyles.semiBoldStyle,
        unselectedLabelStyle: AppStyles.semiBoldStyle,
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
              if (states.contains(MaterialState.selected) || states.contains(MaterialState.pressed)) {
                return appColorScheme.primary;
              }

              return Colors.grey.shade400;
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
          splashRadius: 10),
      snackBarTheme: SnackBarThemeData(
        shape: RoundedRectangleBorder(borderRadius: 5.borderRadius),
        backgroundColor: appColorScheme.onBackground,
        actionTextColor: appColorScheme.background,
        contentTextStyle: AppStyles.body2.copyWith(color: appColorScheme.background),
      ),
      // sliderTheme
      // :,
      // radioTheme
      // :,
      // checkboxTheme
      // :,
      progressIndicatorTheme: ProgressIndicatorThemeData(
        circularTrackColor: Colors.transparent,
        color: appColorScheme.onPrimaryContainer,
        linearMinHeight: 3,
        linearTrackColor: Colors.transparent,
      ),
      popupMenuTheme: PopupMenuThemeData(
          color: appColorScheme.surface,
          elevation: 5,
          shape: RoundedRectangleBorder(borderRadius: 10.borderRadius),
          textStyle: AppStyles.body3),
      useMaterial3: false,
    );
  }
}
