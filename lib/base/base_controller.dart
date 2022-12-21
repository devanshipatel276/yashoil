
import 'package:loader_overlay/loader_overlay.dart';

import '../app/controller/main_controller.dart';
import '../service/api/api_manager.dart';
import '../util/exports.dart';
import '../util/toolbar_model.dart';

abstract class BaseGetxController extends FullLifeCycleController {
  /// here you can define common things that you want in all controller
  /// like apiManager
  ApiManager apiManager = Get.find<ApiManager>(tag: (ApiManager).toString());

  MainController mainController = Get.find<MainController>(tag: (MainController).toString());

  bool shouldObserveLifeCycle = true;

  void onControllerInit();

  void onControllerReady();

  void onControllerClose();

  void onPageResumed();

  void onPagePaused();

  void onPageInactive();

  void onPageDetached();

  ToolBarModel? setUpToolbar();

  void updateToolBar({ToolBarModel? toolBarModel}) {
    ToolBarModel model;
    if (toolBarModel != null) {
      model = toolBarModel;
    } else if (setUpToolbar() != null) {
      model = setUpToolbar()!;
    } else {
      model = ToolBarModel();
    }
    mainController.toolBarModel.value = model;
  }

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addObserver(this);
    onControllerInit();
  }

  @override
  void onClose() {
    super.onClose();
    WidgetsBinding.instance.removeObserver(this);
    onControllerClose();
  }

  @override
  void onReady() {
    super.onReady();
    updateToolBar();
    onControllerReady();
  }

  void showLoader({required bool value}) {
    /// we have to add here code to show and hide loader
    hideKeyboard();
    if (value) {
      Get.context?.loaderOverlay.show();
    } else {
      Get.context?.loaderOverlay.hide();
    }
  }

  void showSnackBar({required String value}) {
    /// here we show snackbar
    
    hideKeyboard();
    Get.snackbar("", value,
        messageText: Text(value,
            softWrap: true,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: AppStyles.mediumStyle.copyWith(fontSize: 16, color: AppColors.white)),
        backgroundColor: AppColors.black,
        // maxWidth: screen.width < 500 ? screen.width : 500,
        margin: const EdgeInsets.all(0),
        isDismissible: true,
        padding: const EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 15),
        snackStyle: SnackStyle.GROUNDED,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const SizedBox());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(shouldObserveLifeCycle){
      switch (state) {
        case AppLifecycleState.paused:
          {
            hideKeyboard();
            onPagePaused();
            break;
          }
        case AppLifecycleState.inactive:
          {
            onPageInactive();
            break;
          }
        case AppLifecycleState.resumed:
          {
            hideKeyboard();
            updateToolBar();
            onPageResumed();
            break;
          }
        case AppLifecycleState.detached:
          {
            onPageDetached();
            break;
          }
      }  
    }
  }

  Future<bool> checkAndCloseDrawer() async {
    var canPop = Scaffold.of(Get.context!).isDrawerOpen;
    Scaffold.of(Get.context!).closeDrawer();
    return Future.value(canPop);
  }

  void hideKeyboard(){
    FocusManager.instance.primaryFocus?.unfocus();
  }

  /// below are some extensions on GetNavigation
  /// please only use this methods to do navigation
  /// (if the method you want is not available here only then you can use Get. methods)

  void _afterNavigation() {
    hideKeyboard();
    shouldObserveLifeCycle = true;
    updateToolBar();
    onPageResumed();
  }

  void _beforeNavigation() {
    hideKeyboard();
    onPagePaused();
    shouldObserveLifeCycle = false;
  }

  Future<V?>? toNamed<V>(String page,
      {dynamic arguments, int? id, bool preventDuplicates = true, Map<String, String>? parameters}) async {
    // add onPause too
    _beforeNavigation();
    V? pageResult = await Get.toNamed<V>(page,
        arguments: arguments, id: id, preventDuplicates: preventDuplicates, parameters: parameters);
   _afterNavigation();
    return Future.value(pageResult);
  }

  Future<V?>? to<V>(
    dynamic page, {
    bool? opaque,
    Transition? transition,
    Curve? curve,
    Duration? duration,
    int? id,
    String? routeName,
    bool fullscreenDialog = false,
    dynamic arguments,
    Bindings? binding,
    bool preventDuplicates = true,
    bool? popGesture,
    double Function(BuildContext context)? gestureWidth,
  }) async {
    _beforeNavigation();
    V? pageResult = await Get.to<V>(page,
        opaque: opaque,
        transition: transition,
        curve: curve,
        duration: duration,
        id: id,
        routeName: routeName,
        fullscreenDialog: fullscreenDialog,
        arguments: arguments,
        binding: binding,
        preventDuplicates: preventDuplicates,
        popGesture: popGesture,
        gestureWidth: gestureWidth);
   _afterNavigation();
    return Future.value(pageResult);
  }

  Future<V?>? offNamed<V>(
    String page, {
    dynamic arguments,
    int? id,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
  }) async {
    _beforeNavigation();
    V? pageResult = await Get.offNamed<V>(page,
        arguments: arguments, id: id, preventDuplicates: preventDuplicates, parameters: parameters);
   _afterNavigation();
    return Future.value(pageResult);
  }

  Future<V?>? offUntil<V>(Route<V> page, RoutePredicate predicate, {int? id}) async {
    _beforeNavigation();
    V? pageResult = await Get.offUntil<V>(page, predicate, id: id);
   _afterNavigation();
    return Future.value(pageResult);
  }

  Future<V?>? offNamedUntil<V>(
    String page,
    RoutePredicate predicate, {
    int? id,
    dynamic arguments,
    Map<String, String>? parameters,
  }) async {
    _beforeNavigation();
    V? pageResult = await Get.offNamedUntil<V>(page, predicate, id: id, parameters: parameters, arguments: arguments);
   _afterNavigation();
    return Future.value(pageResult);
  }

  Future<V?>? offAndToNamed<V>(
    String page, {
    dynamic arguments,
    int? id,
    dynamic result,
    Map<String, String>? parameters,
  }) async {
    _beforeNavigation();
    V? pageResult = await Get.offAndToNamed<V>(page, arguments: arguments, id: id, result: result);
   _afterNavigation();
    return Future.value(pageResult);
  }

  Future<V?>? offAllNamed<V>(
    String newRouteName, {
    RoutePredicate? predicate,
    dynamic arguments,
    int? id,
    Map<String, String>? parameters,
  }) async {
    _beforeNavigation();
    V? pageResult = await Get.offAllNamed<V>(newRouteName,
        predicate: predicate, arguments: arguments, id: id, parameters: parameters);
   _afterNavigation();
    return Future.value(pageResult);
  }

  Future<V?>? off<V>(
    dynamic page, {
    bool opaque = false,
    Transition? transition,
    Curve? curve,
    bool? popGesture,
    int? id,
    String? routeName,
    dynamic arguments,
    Bindings? binding,
    bool fullscreenDialog = false,
    bool preventDuplicates = true,
    Duration? duration,
    double Function(BuildContext context)? gestureWidth,
  }) async {
    _beforeNavigation();
    V? pageResult = await Get.off<V>(page,
        opaque: opaque,
        transition: transition,
        curve: curve,
        popGesture: popGesture,
        id: id,
        routeName: routeName,
        arguments: arguments,
        binding: binding,
        fullscreenDialog: fullscreenDialog,
        preventDuplicates: preventDuplicates,
        duration: duration,
        gestureWidth: gestureWidth);

   _afterNavigation();

    return Future.value(pageResult);
  }

  Future<V?>? offAll<V>(
    dynamic page, {
    RoutePredicate? predicate,
    bool opaque = false,
    bool? popGesture,
    int? id,
    String? routeName,
    dynamic arguments,
    Bindings? binding,
    bool fullscreenDialog = false,
    Transition? transition,
    Curve? curve,
    Duration? duration,
    double Function(BuildContext context)? gestureWidth,
  }) async {
    _beforeNavigation();
    V? pageResult = await Get.offAll<V>(page,
        predicate: predicate,
        opaque: opaque,
        popGesture: popGesture,
        id: id,
        routeName: routeName,
        arguments: arguments,
        binding: binding,
        fullscreenDialog: fullscreenDialog,
        transition: transition,
        curve: curve,
        duration: duration,
        gestureWidth: gestureWidth);

   _afterNavigation();

    return Future.value(pageResult);
  }
}
