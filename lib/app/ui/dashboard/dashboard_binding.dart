import 'package:yash_oil/app/ui/dashboard/dashboard_controller.dart';

import '../../../util/exports.dart';
import '../orderlist/order_list_controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashBoardController(), tag: (DashBoardController).toString());
    Get.put(OrderListController(), tag: (OrderListController).toString());
  }
}
