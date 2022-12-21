
import '../util/exports.dart';
import 'base_controller.dart';

abstract class BaseGetView<T extends BaseGetxController> extends GetView<T> {
  const BaseGetView({Key? key}) : super(key: key);

  Widget buildView();

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
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return !await controller.checkAndCloseDrawer();
        },
        child: buildView());
  }
}
