import '../../../base/base_controller.dart';
import '../../../util/exports.dart';
import '../../../util/toolbar_model.dart';
import '../main_controller.dart';

class SplashController extends BaseGetxController {
  @override
  void onControllerReady() {
    Future.delayed(Duration(seconds: 2), () async => offNamed(AppPages.login));
  }

  MainController? getParentController() {
    return Get.find<MainController>(tag: (MainController).toString());
  }

  @override
  ToolBarModel? setUpToolbar() {
    return ToolBarModel(currentController: this, isToolBarVisible: false);
  }
}
