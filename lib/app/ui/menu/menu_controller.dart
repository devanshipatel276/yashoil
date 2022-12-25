import 'package:yash_oil/app/ui/dashboard/dashboard_controller.dart';
import 'package:yash_oil/app/ui/main_controller.dart';
import 'package:yash_oil/app/ui/menu/menu_model.dart';

import '../../../base/base_controller.dart';
import '../../../util/exports.dart';
import '../../../util/toolbar_model.dart';

class MenuController extends BaseGetxController {
  var dashboardController =
      Get.find<DashBoardController>(tag: (DashBoardController).toString());
  RxList<MenuModel> menuList = <MenuModel>[
    MenuModel(
      title: AppString.addNewOrderKey.tr,
      imagePath: Assets.svg.icAddNew,
      menuType: MenuType.addNewOrder,
    ),
  ].obs;

  @override
  void onControllerReady() {}

  MainController? getParentController() {
    return Get.find<MainController>(tag: (MainController).toString());
  }

  @override
  ToolBarModel? setUpToolbar() {
    return ToolBarModel(
      currentController: this,
      isToolBarVisible: true,
      isLogoVisible: false,
      isCrossVisible: true,
    );
  }

  void handleLogOut() {
    offAllNamed(AppPages.login);
  }

  void handleClick(MenuType menuType) {
    switch (menuType) {
      case MenuType.addNewOrder:
        toNamed(AppPages.addOrder);
        break;
    }
  }
}
