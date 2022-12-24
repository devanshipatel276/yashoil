import 'package:yash_oil/app/ui/menu/menu_controller.dart';

import '../../../util/exports.dart';

class MenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MenuController(), tag: (MenuController).toString());
  }
}
