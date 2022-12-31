import 'package:yash_oil/app/ui/main_controller.dart';

import '../../../base/base_controller.dart';
import '../../../util/exports.dart';
import '../../../util/toolbar_model.dart';

class LoginController extends BaseGetxController {
  final formKey = GlobalKey<FormState>();
  final isObscureText = true.obs;
  TextEditingController emailController =
      TextEditingController(text: "darshan504patel@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "Darshan@123");

  @override
  void onControllerReady() {}

  MainController? getParentController() {
    return Get.find<MainController>(tag: (MainController).toString());
  }

  @override
  ToolBarModel? setUpToolbar() {
    return ToolBarModel(currentController: this, isToolBarVisible: false);
  }
}
