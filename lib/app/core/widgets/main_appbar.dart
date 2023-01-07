import '../../../util/exports.dart';
import '../../ui/main_controller.dart';

/// use this class to show AppBar at app level(Global or Shared AppBar)
/// ( to be used in MyApp Widget)

class MainAppBar extends GetResponsiveView {
  MainAppBar({Key? key}) : super(key: key);

  @override
  MainController get controller =>
      Get.find<MainController>(tag: (MainController).toString());

  @override
  Widget phone() {
    return Obx(() => Visibility(
        visible: controller.toolBarModel.value.isToolBarVisible,
        child: Column(
          children: [
            AppBar(
                title: controller.toolBarModel.value.isTitleVisible
                    ? CustomTextLabel(
                        label: '${controller.toolBarModel.value.title} ')
                    : (controller.toolBarModel.value.isLogoVisible
                        ? showLogo()
                        : null),
                leading: getLeading()),
            divider(color: AppColors.whiteBackGroundColor.withOpacity(0.5))
          ],
        )));
  }

  Widget? getLeading() {
    if (controller.toolBarModel.value.isDrawerRequired) {
      return IconButton(
          onPressed: controller.toolBarModel.value.onDrawerIconClick ??
              () {
                controller.toolBarModel.value.currentController
                    ?.toNamed(AppPages.menu);
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
