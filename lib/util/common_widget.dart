import 'package:flutter/cupertino.dart';
import 'package:yash_oil/app/enums/enums_utils.dart';
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

Future openAlertDialog(
  BuildContext context, {
  String title = "",
  String subTitle = "",
  String successLabel = "",
  String cancelLabel = "",
  VoidCallback? onSuccess,
  VoidCallback? onCancel,
  EdgeInsetsGeometry? titlePadding = const EdgeInsets.all(14),
  EdgeInsetsGeometry? buttonPadding = const EdgeInsets.only(left: 8, right: 8),
  EdgeInsetsGeometry? subTitlePadding =
      const EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 14),
}) {
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => CupertinoAlertDialog(
            title: CustomTextLabel(
              label: title,
              style: AppStyles.textMediumSPPro.copyWith(
                  color: AppColors.blackTextColor, fontSize: Dimens.fontSize16),
            ),
            content: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: CustomTextLabel(
                      label: subTitle,
                      style: AppStyles.textRegularSPPro
                          .copyWith(color: AppColors.blackTextColor)),
                ),
              ],
            ),
            actions: successLabel.isNotEmpty && cancelLabel.isNotEmpty
                ? [
                    CupertinoDialogAction(
                      onPressed: () {
                        goBack();
                        onCancel?.call();
                      },
                      child: CustomTextLabel(
                        label: cancelLabel,
                        style: AppStyles.textRegularSPPro.copyWith(
                            color: AppColors.dialogTextColor,
                            fontSize: Dimens.fontSize16),
                      ),
                    ),
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      onPressed: () {
                        goBack();
                        onSuccess?.call();
                      },
                      child: CustomTextLabel(
                        label: successLabel,
                        style: AppStyles.textRegularSPPro.copyWith(
                            color: AppColors.dialogTextColor,
                            fontSize: Dimens.fontSize16),
                      ),
                    ),
                  ]
                : [
                    CupertinoDialogAction(
                      isDefaultAction: true,
                      onPressed: () {
                        goBack();
                        onSuccess?.call();
                      },
                      child: CustomTextLabel(
                        label: successLabel,
                        style: AppStyles.textRegularSPPro.copyWith(
                            color: AppColors.dialogTextColor,
                            fontSize: Dimens.fontSize16),
                      ),
                    )
                  ],
          ));
}

Future<DateTime?> openDatePicker(BuildContext context) async {
  return await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(3000),
      builder: (context, child) => Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.orangeAppBarColor, // <-- SEE HERE
              onPrimary: AppColors.whiteAppBarColor, // <-- SEE HERE
              onSurface: AppColors.blackBackGroundColor, // <-- SEE HERE
            ),
          ),
          child: child!));
}

showOrderDetailDialog(
    BuildContext context, List<String> list, TextEditingController controller,
    {String title = ""}) {
  Rx<ContainerType> selected = ContainerType.fiveLtr.obs;
  return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) => CupertinoAlertDialog(
            title: CustomTextLabel(
              label: AppString.orderDetailsKey.tr,
              style: AppStyles.textMediumSPPro.copyWith(
                  color: AppColors.blackTextColor, fontSize: Dimens.fontSize16),
            ),
            content: Theme(
              data: Theme.of(context).copyWith(
                inputDecorationTheme: InputDecorationTheme(
                  fillColor: AppColors.transparent,
                  prefixStyle: AppStyles.textRegular,
                  hintStyle: AppStyles.textRegular
                      .copyWith(color: AppColors.blackTextColor),
                  labelStyle: AppStyles.textRegular
                      .copyWith(color: AppColors.blackTextColor),
                  focusColor: AppColors.blackBackGroundColor,
                  hoverColor: AppColors.blackBackGroundColor,
                  errorStyle: AppStyles.textRegular
                      .copyWith(color: AppColors.blackTextColor),
                  iconColor: AppColors.blackBackGroundColor,
                  alignLabelWithHint: true,
                  enabledBorder: 8.outlineInputBorder(
                    borderSide:
                        1.5.borderSide(color: AppColors.blackBackGroundColor),
                  ),
                  focusedBorder: 8.outlineInputBorder(
                    borderSide:
                        1.5.borderSide(color: AppColors.blackBackGroundColor),
                  ),
                  border: 8.outlineInputBorder(
                    borderSide:
                        1.5.borderSide(color: AppColors.blackBackGroundColor),
                  ),
                  errorBorder: 8.outlineInputBorder(
                    borderSide: 1.5.borderSide(color: AppColors.redErrorColor),
                  ),
                  focusedErrorBorder: 8.outlineInputBorder(
                    borderSide: 1.5.borderSide(color: AppColors.redErrorColor),
                  ),
                  disabledBorder: 4.outlineInputBorder(
                    borderSide:
                        1.5.borderSide(color: AppColors.blackBackGroundColor),
                  ),
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  floatingLabelStyle: AppStyles.textRegular
                      .copyWith(color: AppColors.blackTextColor),
                ),
              ),
              child: Obx(
                () => Column(
                  children: [
                    radioView(
                        value: ContainerType.fiveLtr,
                        selection: selected.value,
                        label: AppString.fiveLtrKey.tr,
                        onChanged: (value) {
                          selected.value = value!;
                        }),
                    radioView(
                        value: ContainerType.fifteenKgTin,
                        selection: selected.value,
                        label: AppString.fifteenKgTinKey.tr,
                        onChanged: (value) {
                          selected.value = value!;
                        }),
                    radioView(
                        value: ContainerType.fifteenKgPlastic,
                        selection: selected.value,
                        label: AppString.fifteenKgPlasticKey.tr,
                        onChanged: (value) {
                          selected.value = value!;
                        }),
                    CustomTextFormField(
                      controller: controller,
                      cursorColor: AppColors.blackBackGroundColor,
                      label: AppString.quantityKey.tr,
                      fillColor: Colors.transparent,
                    )
                  ],
                ),
              ),
            ),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  goBack();
                },
                child: CustomTextLabel(
                  label: AppString.cancelBtnKey.tr,
                  style: AppStyles.textRegularSPPro.copyWith(
                      color: AppColors.dialogTextColor,
                      fontSize: Dimens.fontSize16),
                ),
              ),
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () {
                  goBack();
                },
                child: CustomTextLabel(
                  label: AppString.saveKey.tr,
                  style: AppStyles.textRegularSPPro.copyWith(
                      color: AppColors.dialogTextColor,
                      fontSize: Dimens.fontSize16),
                ),
              ),
            ],
          ));
}

Widget radioView(
    {required dynamic value,
    required dynamic selection,
    required String label,
    ValueChanged<dynamic?>? onChanged}) {
  return RadioListTile(
      value: value,
      dense: true,
      controlAffinity: ListTileControlAffinity.trailing,
      groupValue: selection,
      contentPadding: EdgeInsets.zero,
      visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity),
      title: CustomTextLabel(
        label: label,
        textAlign: TextAlign.start,
        style: AppStyles.textRegular.copyWith(color: AppColors.blackTextColor),
      ),
      onChanged: onChanged);
}
