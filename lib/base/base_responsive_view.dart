import '../../../util/exports.dart';
import '../app/core/widgets/main_appbar.dart';
import 'base_controller.dart';

abstract class BaseGetResponsiveView<T extends BaseGetxController>
    extends GetResponsiveView<T> {
  BaseGetResponsiveView({Key? key}) : super(key: key);

  Widget buildPhoneWidget();

  Widget buildTabletWidget() {
    return Container();
  }

  Widget buildDesktopWidget() {
    return Container();
  }

  String getTag();

  @override
  T get controller {
    return Get.find<T>(tag: getTag());
  }

  C getController<C extends GetxController>({String? tag}) {
    return Get.find<C>(tag: tag);
  }

  S getService<S extends GetxService>({String? tag}) {
    return Get.find<S>(tag: tag);
  }

  @override
  Widget phone() {
    return WillPopScope(
      onWillPop: () async {
        return !await controller.checkAndCloseDrawer();
      },
      child: SafeArea(
        child: Column(
          children: [
            MainAppBar(),
            Expanded(child: buildPhoneWidget()),
          ],
        ),
      ),
    );
  }
}
