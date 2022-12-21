import '../../../base/base_controller.dart';
import '../../../util/exports.dart';
import '../../../util/toolbar_model.dart';
import '../../controller/main_controller.dart';

class SplashController extends BaseGetxController {
  @override
  void onControllerReady() {
//     After Splash screen, if it is first time user then redirected
//     to the introduction screen.
//     If user already has an account then redirected to home screen.
//     Introductory Screen will be available only for first time users.
//     If user is opening application for second time then post splash
//     screen will be login screen.

    // Future.delayed(
    //     const Duration(seconds: 1), () async => offNamed(AppPages.musicTray));

    // Future.delayed(
    //     const Duration(seconds: 2), () async => offNamed(AppPages.login));
  }

  MainController? getParentController() {
    return Get.find<MainController>(tag: (MainController).toString());
  }

  @override
  ToolBarModel? setUpToolbar() {
    return ToolBarModel(currentController: this, isToolBarVisible: false);
  }
}
