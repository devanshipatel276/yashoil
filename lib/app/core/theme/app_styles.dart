import '../../../util/exports.dart';

abstract class AppStyles {
  // MTSans Fonts
  static const TextStyle _textStyleMTSans =
      TextStyle(color: AppColors.primaryWhiteColor, fontFamily: 'MTSans');
  static final TextStyle semiBoldStyleMTSans = _textStyleMTSans.copyWith(
    fontWeight: FontWeight.w600,
  );
  static final TextStyle textDoubleExtraLargeMTSans =
      semiBoldStyleMTSans.copyWith(
    fontSize: Dimens.fontSize48,
  );

  // Roboto Fonts
  static final TextStyle _textStyleRoboto =
      GoogleFonts.roboto(color: AppColors.darkGrayColor);
  static final TextStyle mediumStyleRoboto = _textStyleRoboto.copyWith(
    fontWeight: FontWeight.w500,
  );
  static final TextStyle textMediumRoboto = mediumStyle.copyWith(
    fontSize: Dimens.fontSize16,
  );

  // SF Pro Display Fonts
  static const TextStyle _textStyleSPPro =
      TextStyle(color: AppColors.blackColor, fontFamily: 'SF Pro Display');
  static final TextStyle semiBoldStyleSPPro = _textStyleSPPro.copyWith(
    fontWeight: FontWeight.w600,
  );
  static final TextStyle textMediumSPPro = semiBoldStyleSPPro.copyWith(
    fontSize: Dimens.fontSize18,
  );
  static final TextStyle textRegularSPPro = _textStyleSPPro.copyWith(
    fontSize: Dimens.fontSize13,
  );

  // Graphik Fonts
  static const TextStyle _textStyle =
      TextStyle(color: AppColors.primaryWhiteColor, fontFamily: 'Graphik');

  static final TextStyle regularStyle = _textStyle.copyWith(
    fontWeight: FontWeight.w400,
  );
  static final TextStyle lightStyle = _textStyle.copyWith(
    fontWeight: FontWeight.w300,
  );

  static final TextStyle mediumStyle = _textStyle.copyWith(
    fontWeight: FontWeight.w500,
  );

  static final TextStyle semiBoldStyle = _textStyle.copyWith(
    fontWeight: FontWeight.w600,
  );

  static final TextStyle boldStyle = _textStyle.copyWith(
    fontWeight: FontWeight.w700,
  );

  static final TextStyle button =
      mediumStyle.copyWith(color: AppColors.whiteBackGroundColor);

  /// NAME         SIZE  WEIGHT  SPACING
  /// caption      12.0  regular  0
  static final TextStyle caption = mediumStyle.copyWith(
    fontSize: Dimens.fontSize14,
  );

  static ThemeData get myTheme => ThemeData(
        cardColor: Colors.white,
        primaryColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      );

  static TextStyle get hintStyle => lightStyle.copyWith(
        color: AppColors.secondaryPurpleColor,
      );

  static TextStyle get textStyle => regularStyle.copyWith(
        color: AppColors.secondaryPurpleColor,
        fontSize: Dimens.fontSize14,
      );

  static TextStyle get flatButtonStyleLight => regularStyle.copyWith(
        color: AppColors.purpleTextColor,
        fontSize: Dimens.fontSize14,
      );

  static TextStyle get outlineButtonStyleLight => semiBoldStyle.copyWith(
        color: AppColors.primaryWhiteColor,
        fontSize: Dimens.fontSize14,
      );

  static InputBorder get editTextWhiteBorder => const UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.secondaryPurpleColor,
          width: 0.8,
        ),
      );

  static final TextStyle textDoubleExtraLarge = mediumStyle.copyWith(
    fontSize: Dimens.fontSize30,
  );
  static final TextStyle textExtraLarge = semiBoldStyle.copyWith(
    fontSize: Dimens.fontSize22,
  );
  static final TextStyle textRegularExtraLarge = regularStyle.copyWith(
    fontSize: Dimens.fontSize22,
  );
  static final TextStyle textLarge = semiBoldStyle.copyWith(
    fontSize: Dimens.fontSize18,
  );
  static final TextStyle textMediumLarge = mediumStyle.copyWith(
    fontSize: Dimens.fontSize18,
  );
  static final TextStyle textMedium = mediumStyle.copyWith(
    fontSize: Dimens.fontSize16,
  );
  static final TextStyle textRegularMedium = regularStyle.copyWith(
    fontSize: Dimens.fontSize16,
  );
  static final TextStyle textRegular = mediumStyle.copyWith(
    fontSize: Dimens.fontSize14,
  );
  static final TextStyle textSmall = regularStyle.copyWith(
    fontSize: Dimens.fontSize12,
  );
  static final TextStyle textExtraSmall = regularStyle.copyWith(
    fontSize: Dimens.fontSize10,
  );
}
