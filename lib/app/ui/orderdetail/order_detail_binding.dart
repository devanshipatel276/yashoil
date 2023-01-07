import '../../../util/exports.dart';
import 'order_detail_controller.dart';

class OrderDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderDetailController(), tag: (OrderDetailController).toString());
  }
}
