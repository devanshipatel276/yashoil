import 'package:yash_oil/app/ui/editorder/edit_order_controller.dart';

import '../../../util/exports.dart';

class EditOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EditOrderController(), tag: (EditOrderController).toString());
  }
}
