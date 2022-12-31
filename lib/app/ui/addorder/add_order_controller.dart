import 'package:yash_oil/app/model/container_detail_model.dart';
import 'package:yash_oil/app/ui/main_controller.dart';

import '../../../base/base_controller.dart';
import '../../../util/date_utils.dart';
import '../../../util/exports.dart';
import '../../../util/toolbar_model.dart';
import '../../enums/enums_utils.dart';

class AddOrderController extends BaseGetxController {
  //variable keys and controllers
  TextEditingController orderCompleteDateController = TextEditingController();
  TextEditingController orderDateController = TextEditingController();
  TextEditingController customerNameController = TextEditingController();
  TextEditingController customerAddressController = TextEditingController();
  TextEditingController commentsController = TextEditingController();
  TextEditingController customerNumberController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController billNumberController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final dialogFormKey = GlobalKey<FormState>();

  final RxString selectedDeliveryStatus = AppString.pendingKey.tr.obs;
  RxString selectedPaymentMode = AppString.unPaidKey.tr.obs;
  RxList<LocalContainerDetailModel> containerDetailList =
      <LocalContainerDetailModel>[].obs;
  Rx<ContainerType> selected = ContainerType.fiveLtr.obs;
  late LocalContainerDetailModel containerDetailModel;

  //dropdown and radio list
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

  @override
  void onControllerReady() {}

  @override
  void onInit() {
    super.onInit();
    orderDateController.text = dateToString(DateTime.now());
    containerDetailModel = LocalContainerDetailModel(
      type: selected.value,
      price: priceController.text,
      quantity: quantityController.text,
    );
    containerDetailList.listen((p0) {
      for (var element in p0) {
        print(
            "OrderType ---> ${element.type}, Order Quantity--->${element.quantity}, Order Price--> ${element.price}");
      }
    });
  }

  MainController? getParentController() {
    return Get.find<MainController>(tag: (MainController).toString());
  }

  void addContainerDetail() {
    containerDetailModel = LocalContainerDetailModel(
      type: selected.value,
      price: priceController.text,
      quantity: quantityController.text,
    );
    containerDetailList.add(containerDetailModel);
    goBack();
  }

  void deleteContainerDetail(
      LocalContainerDetailModel localContainerDetailModel) {
    containerDetailList.remove(localContainerDetailModel);
  }

  String getTotalAmount() {
    var total = 0;
    for (var element in containerDetailList) {
      total = total + int.parse(element.price);
    }
    return total.toString();
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
