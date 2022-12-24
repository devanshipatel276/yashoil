import 'package:yash_oil/app/ui/addorder/add_order_controller.dart';

import '../../../util/exports.dart';

class AddOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddOrderController(), tag: (AddOrderController).toString());
  }
}
