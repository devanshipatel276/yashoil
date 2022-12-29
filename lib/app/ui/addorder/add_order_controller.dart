import 'package:yash_oil/app/ui/main_controller.dart';

import '../../../base/base_controller.dart';
import '../../../util/date_utils.dart';
import '../../../util/exports.dart';
import '../../../util/toolbar_model.dart';

class AddOrderController extends BaseGetxController {
  TextEditingController orderCompleteDateController = TextEditingController();
  TextEditingController orderDateController = TextEditingController();
  TextEditingController customerNameController = TextEditingController();
  TextEditingController customerAddressController = TextEditingController();
  TextEditingController customerNumberController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController billNumberController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final deliveryStatusList = [
    AppString.deliveredKey.tr,
    AppString.pendingKey.tr
  ];
  final paymentModeList = [
    AppString.cashKey.tr,
    AppString.onlineKey.tr,
    AppString.unPaidKey.tr
  ];
  final orderDetailList = [
    AppString.fiveLtrKey.tr,
    AppString.fifteenKgTinKey.tr,
    AppString.fifteenKgPlasticKey.tr,
    AppString.fifteenLtrPlasticKey.tr,
    AppString.fifteenLtrTinKey.tr
  ];
  final RxString selectedDeliveryStatus = AppString.pendingKey.tr.obs;
  RxString selectedPaymentMode = AppString.unPaidKey.tr.obs;

  @override
  void onControllerReady() {}

  @override
  void onInit() {
    super.onInit();
    orderDateController.text = dateToString(DateTime.now());
  }

  MainController? getParentController() {
    return Get.find<MainController>(tag: (MainController).toString());
  }

  @override
  ToolBarModel? setUpToolbar() {
    return ToolBarModel(
        currentController: this,
        isToolBarVisible: true,
        isTitleVisible: true,
        title: AppString.addNewOrderKey.tr,
        isBackVisible: true);
  }
}
