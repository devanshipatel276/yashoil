
import '../../../base/base_controller.dart';
import '../../../util/exports.dart';
import '../../../util/toolbar_model.dart';

class DetailsController extends BaseGetxController {

  @override
  ToolBarModel? setUpToolbar() {
    return ToolBarModel(isToolBarVisible: true, title: "DetailsPage", isTitleVisible: true, isBackVisible: false, isDrawerRequired: true);
  }

  @override
  void onControllerClose() {
    printLog("LifeCycleCallbacks : Details Closed");
  }

  @override
  void onControllerInit() {
    printLog("LifeCycleCallbacks : Details Init");
  }

  @override
  void onControllerReady() {
    printLog("LifeCycleCallbacks : Details Ready");
  }

  @override
  void onPageDetached() {
    printLog("LifeCycleCallbacks : Details Detached.");
  }

  @override
  void onPageInactive() {
    printLog("LifeCycleCallbacks : Details Inactive.");
  }

  @override
  void onPagePaused() {
    printLog("LifeCycleCallbacks : Details Paused.");
  }

  @override
  void onPageResumed() {
    printLog("LifeCycleCallbacks : Details Resumed.");
  }
  
}
