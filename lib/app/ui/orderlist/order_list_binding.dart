import '../../../util/exports.dart';
import 'order_list_controller.dart';

class OrderListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderListController(), tag: (OrderListController).toString());
  }
}
