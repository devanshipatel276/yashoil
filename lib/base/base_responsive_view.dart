
import '../util/exports.dart';
import 'base_controller.dart';

abstract class BaseGetResponsiveView<T extends BaseGetxController> extends GetResponsiveView<T> {
  BaseGetResponsiveView({Key? key}) : super(key: key);

  Widget buildPhoneWidget();

  Widget buildTabletWidget();

  Widget buildDesktopWidget();

  String? getTag();

  @override
  T get controller {
    return Get.find<T>(tag: getTag());
  }

  void showLoader({required bool value}) {
    controller.showLoader(value: value);
  }

  void showSnackbar({required String value}) {
    controller.showSnackBar(value: value);
  }

  C getController<C extends GetxController>({String? tag}) {
    return Get.find<C>(tag: tag);
  }

  S getService<S extends GetxService>({String? tag}) {
    return Get.find<S>(tag: tag);
  }

  @override
  Widget desktop() {
    return WillPopScope(
        onWillPop: () async {
          return !await controller.checkAndCloseDrawer();
        },
        child: buildDesktopWidget());
  }

  @override
  Widget phone() {
    return WillPopScope(
        onWillPop: () async {
          return !await controller.checkAndCloseDrawer();
        },
        child: buildPhoneWidget());
  }

  @override
  Widget tablet() {
    return WillPopScope(
        onWillPop: () async {
          return !await controller.checkAndCloseDrawer();
        },
        child: buildTabletWidget());
  }
}
