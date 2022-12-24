import '../../../util/exports.dart';
import '../base/base_controller.dart';

class ToolBarModel {
  bool isToolBarVisible;
  bool isTitleVisible;
  bool isDrawerRequired;
  bool isLogoVisible;
  bool isBackVisible;
  bool isCrossVisible;
  String title;
  BaseGetxController? currentController;

  /// you can also add more as per your need like below

  // var isSettingVisible = true.obs;
  // var isMenuVisible = true.obs;
  Function()? onBackOrClose;
  Color appBarColor;
  Function()? onDrawerIconClick;

  ToolBarModel(
      {this.isToolBarVisible = false,
      this.isTitleVisible = false,
      this.isDrawerRequired = false,
      this.isLogoVisible = false,
      this.isBackVisible = false,
      this.isCrossVisible = false,
      this.appBarColor = AppColors.orangeAppBarColor,
      this.currentController,
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
    BaseGetxController? currentController,
    Function()? onBackOrClose,
    Function()? onDrawerIconClick,
    Color? appBarColor,
  }) {
    var model = ToolBarModel();
    model.isToolBarVisible = isToolBarVisible ?? this.isToolBarVisible;
    model.isTitleVisible = isTitleVisible ?? this.isToolBarVisible;
    model.isLogoVisible = isLogoVisible ?? this.isToolBarVisible;
    model.isBackVisible = isBackVisible ?? this.isToolBarVisible;
    model.isCrossVisible = isCrossVisible ?? this.isToolBarVisible;
    model.appBarColor = appBarColor ?? this.appBarColor;
    model.currentController = currentController;
    model.onDrawerIconClick = onDrawerIconClick;
    model.onBackOrClose = onBackOrClose;
    return model;
  }
}
