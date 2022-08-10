

import '../../../base/base_controller.dart';
import '../../../util/exports.dart';
import '../../../util/toolbar_model.dart';

class LoginController extends BaseGetxController {
  @override
  ToolBarModel? setUpToolbar() {
    return ToolBarModel(isToolBarVisible: true, title: "LoginPage", isTitleVisible: true);
  }

  @override
  void onControllerClose() {
    printLog("LifeCycleCallbacks : Login Closed");
  }

  @override
  void onControllerInit() {
    printLog("LifeCycleCallbacks : Login Init");
  }

  @override
  void onControllerReady() {
    printLog("LifeCycleCallbacks : Login Ready");
  }

  @override
  void onPageDetached() {
    printLog("LifeCycleCallbacks : Login Detached.");
  }

  @override
  void onPageInactive() {
    printLog("LifeCycleCallbacks : Login Inactive.");
  }

  @override
  void onPagePaused() {
    printLog("LifeCycleCallbacks : Login Paused.");
  }

  @override
  void onPageResumed() {
    printLog("LifeCycleCallbacks : Login Resumed.");
  }

}
