import 'package:yash_oil/app/ui/login/login_controller.dart';

import '../../../util/exports.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController(), tag: (LoginController).toString());
  }
}
