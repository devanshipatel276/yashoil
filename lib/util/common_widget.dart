import 'package:yash_oil/util/exports.dart';

Widget loadAsset({String path = "", Size? size, Color? color}) {
  return Image.asset(
    path,
    width: size?.width,
    height: size?.height,
    color: color,
  );
}

void showLoader({required bool value}) {
  /// we have to add here code to show and hide loader
  hideKeyboard();
  if (value) {
    // show loader here
    EasyLoading.show();
  } else {
    EasyLoading.dismiss(animation: true);
    // hide loader here
  }
}

Widget loadMaterialIcon(IconData icons, {double? size, Color? color}) {
  return Icon(
    icons,
    size: size,
    color: color,
  );
}

Widget showLogo() {
  return Container(
    width: 140,
    decoration: BoxDecoration(
        color: AppColors.whiteBackGroundColor,
        border: Border.all(color: AppColors.whiteAppBarColor),
        borderRadius: BorderRadius.circular(32)),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomTextLabel(
        label: AppString.yashOil.tr,
        style: AppStyles.textDoubleExtraLargeMTSans.copyWith(
            fontSize: Dimens.fontSize18,
            color: AppColors.orangeTextColor,
            letterSpacing: 1.4),
      ),
    ),
  );
}

Widget loadSvg(
    {String path = "", Color? color, BoxFit fit = BoxFit.contain, Size? size}) {
  return path.isNotNullOrEmpty
      ? SvgPicture.asset(
          path,
          height: size?.height,
          width: size?.width,
          color: color,
          fit: fit,
        )
      : Container();
}

void showSnackBar(
    {String message = "", String buttonText = "", Function()? onButtonClick}) {
  Get.snackbar("", "",
      colorText: AppColors.blackTextColor,
      backgroundColor: AppColors.lightPurpleBackGroundColor,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(10),
      mainButton: buttonText.isNotNullOrEmpty
          ? TextButton(
              onPressed: onButtonClick,
              child: CustomTextLabel(
                  label: buttonText,
                  style: AppStyles.regularStyle
                      .copyWith(color: AppColors.purpleTextColor)),
            )
          : null,
      messageText: Container(),
      titleText: CustomTextLabel(
          label: message,
          style: AppStyles.regularStyle
              .copyWith(color: AppColors.blackTextColor)));
}
