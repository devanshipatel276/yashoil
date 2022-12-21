import 'package:flutter_base/base/base_controller.dart';

import '../../../util/exports.dart';

class ToolBarModel {
  bool isToolBarVisible;
  bool isTitleVisible;
  bool isDrawerRequired;
  bool isLogoVisible;
  bool isBackVisible;
  bool isCrossVisible;
  String title;
  BaseGetxController? navigator;

  /// you can also add more as per your need like below

  // var isSettingVisible = true.obs;
  // var isMenuVisible = true.obs;
  Function()? onBackOrClose;
  Function()? onDrawerIconClick;

  ToolBarModel({this.isToolBarVisible = false,
    this.isTitleVisible = true,
    this.isDrawerRequired = false,
    this.isLogoVisible = false,
    this.isBackVisible = false,
    this.isCrossVisible = false,
    this.navigator,
    String? title,
    this.onBackOrClose,
    this.onDrawerIconClick})
      : title = title ?? AppString.appName.tr;

  ToolBarModel copyWith({
    bool? isToolBarVisible,
    bool? isTitleVisible,
    bool? isLogoVisible,
    bool? isBackVisible,
    bool? isCrossVisible,
    BaseGetxController? navigator,
    Function()? onBackOrClose,
    Function()? onDrawerIconClick,

  }) {
    var model = ToolBarModel();
    model.isToolBarVisible = isToolBarVisible ?? this.isToolBarVisible;
    model.isTitleVisible = isTitleVisible ?? this.isToolBarVisible;
    model.isLogoVisible = isLogoVisible ?? this.isToolBarVisible;
    model.isBackVisible = isBackVisible ?? this.isToolBarVisible;
    model.isCrossVisible = isCrossVisible ?? this.isToolBarVisible;
    model.navigator = navigator;
    model.onDrawerIconClick = onDrawerIconClick;
    model.onBackOrClose = onBackOrClose;
    return model;
  }
}
