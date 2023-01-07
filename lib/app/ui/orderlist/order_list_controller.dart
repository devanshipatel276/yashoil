import 'package:yash_oil/app/model/order_detail_model.dart';
import 'package:yash_oil/app/ui/main_controller.dart';

import '../../../base/base_controller.dart';
import '../../../util/exports.dart';
import '../../../util/toolbar_model.dart';

class OrderListController extends BaseGetxController {
  var orderList = <OrderDetailModel>[].obs;

  @override
  void onControllerReady() {}

  MainController? getParentController() {
    return Get.find<MainController>(tag: (MainController).toString());
  }

  @override
  void onInit() async {
    super.onInit();
    isShowInternalAppBar.value = false;
    orderList.value = await FireBaseDB.getOrders();
  }

  @override
  void update([List<Object>? ids, bool condition = true]) async {
    super.update(ids, condition);
    orderList.value = await FireBaseDB.getOrders();
  }

  @override
  ToolBarModel? setUpToolbar() {
    return ToolBarModel(
        currentController: this,
        appBarColor: AppColors.orangeBackGroundColor,
        isToolBarVisible: true,
        isLogoVisible: true,
        isDrawerRequired: true);
  }
}
