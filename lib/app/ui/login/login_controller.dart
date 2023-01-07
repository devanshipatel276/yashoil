import 'package:yash_oil/app/core/config/shared_preference.dart';
import 'package:yash_oil/app/ui/main_controller.dart';

import '../../../base/base_controller.dart';
import '../../../util/exports.dart';
import '../../../util/toolbar_model.dart';

class LoginController extends BaseGetxController {
  final formKey = GlobalKey<FormState>();
  final isObscureText = true.obs;
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  @override
  void onControllerReady() {}

  MainController? getParentController() {
    return Get.find<MainController>(tag: (MainController).toString());
  }

  @override
  ToolBarModel? setUpToolbar() {
    return ToolBarModel(currentController: this, isToolBarVisible: false);
  }

  handleLogin() {
    FireBaseDB.firebaseLogin(
        email: emailController.text,
        password: passwordController.text,
        onLogin: () {
          SharedPref.setValue(PrefsKey.isLoggedIn, true);
          offNamed(AppPages.dashboard);
        });
  }
}
