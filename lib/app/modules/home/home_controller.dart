

import '../../../base/base_controller.dart';

import '../../../util/exports.dart';
import '../../../util/toolbar_model.dart';

/// always use ViewControllerBase with BaseGetView and BaseGetResponsiveView
/// it will give proper handling over lifecycle and state management

class HomeController extends BaseGetxController with GetTickerProviderStateMixin {
  var switch1 = false.obs;

  @override
  ToolBarModel? setUpToolbar() {
    return ToolBarModel(isToolBarVisible: true, title: "HomePage", isTitleVisible: true, isDrawerRequired: true, navigator: this);
  }

  @override
  void onControllerClose() {
    printLog("LifeCycleCallbacks : Home Closed");
  }

  @override
  void onControllerInit() {
    printLog("LifeCycleCallbacks : Home Init");
  }

  @override
  void onControllerReady() {
    printLog("LifeCycleCallbacks : Home Ready");
  }

  @override
  void onPageDetached() {
    printLog("LifeCycleCallbacks : Home Detached.");
  }

  @override
  void onPageInactive() {
    printLog("LifeCycleCallbacks : Home Inactive.");
  }

  @override
  void onPagePaused() {
    printLog("LifeCycleCallbacks : Home Paused.");
  }

  @override
  void onPageResumed() {
    printLog("LifeCycleCallbacks : Home Resumed.");
  }

}
