import 'package:yash_oil/app/ui/dashboard/dashboard_controller.dart';

import '../../../util/exports.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashBoardController(), tag: (DashBoardController).toString());
  }
}
