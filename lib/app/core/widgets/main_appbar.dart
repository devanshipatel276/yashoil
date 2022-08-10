


import '../../../util/exports.dart';
import '../../../util/toolbar_model.dart';

/// use this class to show AppBar at app level(Global or Shared AppBar)
/// ( to be used in MyApp Widget)

class MainAppBar extends GetResponsiveView {
  MainAppBar({required this.model, Key? key}) : super(key: key);
  final ToolBarModel model;

  @override
  Widget desktop() {
    return AppBar(
      title: model.isTitleVisible
          ? Text('${model.title} In Desktop')
          : (model.isLogoVisible ? const FlutterLogo() : null),
      leading: getLeading()
    );
  }

  @override
  Widget tablet() {
      return AppBar(
        title: model.isTitleVisible
            ? Text('${model.title} In Tablet')
            : (model.isLogoVisible ? const FlutterLogo() : null),
        leading: getLeading()
      );
  }

  @override
  Widget phone() {
    return AppBar(
      title: model.isTitleVisible
          ? Text('${model.title} In Phone')
          : (model.isLogoVisible ? const FlutterLogo() : null),
      leading: getLeading()
    );
  }

  Widget? getLeading() {
    if (model.isDrawerRequired) {
      return IconButton(
          onPressed: model.onDrawerIconClick ??
                  () {
                Scaffold.of(Get.context!).openDrawer();
              },
          icon: const Icon(Icons.menu));
    } else if (model.isBackVisible) {
      return IconButton(
          onPressed: model.onBackOrClose ??
                  () {
                Get.closeAllSnackbars();
                Get.back();
              },
          icon: const Icon(Icons.arrow_back_rounded));
    } else if (model.isCrossVisible) {
      return IconButton(
          onPressed: model.onBackOrClose ??
                  () {
                Get.closeAllSnackbars();
                Get.back();
              },
          icon: const Icon(Icons.close));
    }

    return null;
  }

}
