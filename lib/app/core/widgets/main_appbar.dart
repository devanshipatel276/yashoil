import '../../../util/exports.dart';
import '../../controller/main_controller.dart';

/// use this class to show AppBar at app level(Global or Shared AppBar)
/// ( to be used in MyApp Widget)

class MainAppBar extends GetResponsiveView {
  MainAppBar({Key? key}) : super(key: key);

  @override
  MainController get controller =>
      Get.find<MainController>(tag: (MainController).toString());

  @override
  Widget phone() {
    return Obx(
      () => AppBar(
          title: controller.toolBarModel.value.isTitleVisible
              ? Text('${controller.toolBarModel.value.title} In Phone')
              : (controller.toolBarModel.value.isLogoVisible
                  ? const FlutterLogo()
                  : null),
          leading: getLeading()),
    );
  }

  Widget? getLeading() {
    if (controller.toolBarModel.value.isDrawerRequired) {
      return IconButton(
          onPressed: controller.toolBarModel.value.onDrawerIconClick ??
              () {
                /// to hide keyboard on click of drawer icon
                Get.find<MainController>(tag: (MainController).toString())
                    .hideKeyboard();
                Scaffold.of(Get.context!).openDrawer();
              },
          icon: const Icon(Icons.menu));
    } else if (controller.toolBarModel.value.isBackVisible) {
      return IconButton(
          onPressed: controller.toolBarModel.value.onBackOrClose ??
              () {
                Get.closeAllSnackbars();
                Get.back();
              },
          icon: const Icon(Icons.arrow_back_rounded));
    } else if (controller.toolBarModel.value.isCrossVisible) {
      return IconButton(
          onPressed: controller.toolBarModel.value.onBackOrClose ??
              () {
                Get.closeAllSnackbars();
                Get.back();
              },
          icon: const Icon(Icons.close));
    }

    return null;
  }
}
