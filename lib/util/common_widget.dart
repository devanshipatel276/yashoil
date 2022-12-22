import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:yash_oil/app/core/config/app_string.dart';
import 'package:yash_oil/app/core/widgets/custom_text_label.dart';
import 'package:yash_oil/util/common_function.dart';
import 'package:yash_oil/util/exports.dart';

import '../app/core/theme/app_colors.dart';

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
