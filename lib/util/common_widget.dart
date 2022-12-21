import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:yash_oil/util/common_function.dart';

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
