import 'package:yash_oil/app/enums/enums_utils.dart';
import 'package:yash_oil/app/ui/main_controller.dart';

import '../../../base/base_controller.dart';
import '../../../util/date_utils.dart';
import '../../../util/exports.dart';
import '../../../util/toolbar_model.dart';
import '../../model/container_detail_model.dart';
import '../../model/order_detail_model.dart';

class EditOrderController extends BaseGetxController {
  TextEditingController orderPaymentDateController = TextEditingController();
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
  RxString toolBarTitle = AppString.addOrderDetailsKey.tr.obs;
  Rx<ContainerType> selected = ContainerType.fiveLtr.obs;
  late LocalContainerDetailModel containerDetailModel;
  RxBool isShowValidation = false.obs;
  RxList<LocalContainerDetailModel> containerDetailList =
      <LocalContainerDetailModel>[].obs;

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
  void onInit() {
    super.onInit();
    handleEditOrderFlow();
  }

  @override
  void onControllerReady() {}

  MainController? getParentController() {
    return Get.find<MainController>(tag: (MainController).toString());
  }

  @override
  ToolBarModel? setUpToolbar() {
    return ToolBarModel(
        currentController: this,
        isToolBarVisible: true,
        isTitleVisible: true,
        title: AppString.editOrderKey.tr,
        isBackVisible: true);
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

  List<String> getTotalAmount() {
    var total = 0;
    var totalQuantity = 0;
    for (var element in containerDetailList) {
      var quantity = int.parse(element.quantity);
      var price = int.parse(element.price);
      total = total + (quantity * price);
      totalQuantity = totalQuantity + quantity;
    }
    return [total.toString(), totalQuantity.toString()];
  }

  bool checkOrderDetailValidation() {
    return isShowValidation.value = containerDetailList.isEmpty;
  }

  void handleEditOrderFlow() async {
    var orderDetail = await FireBaseDB.getOrderDetails(Get.arguments);

    customerNameController.text = orderDetail?.customerName ?? "";
    customerAddressController.text = orderDetail?.customerAddress ?? "";
    customerNumberController.text = orderDetail?.customerMobileNumber ?? "";
    orderCompleteDateController.text = orderDetail?.orderCompletedDate ?? "";
    orderDateController.text = orderDetail?.orderDate ?? "";
    billNumberController.text = orderDetail?.billNumber ?? "";
    commentsController.text = orderDetail?.comments ?? "";
    orderPaymentDateController.text = orderDetail?.paymentDate ?? "";
    selectedPaymentMode.value =
        orderDetail?.paymentStatus ?? AppString.unPaidKey.tr;
    selectedDeliveryStatus.value =
        orderDetail?.deliveryStatus ?? AppString.pendingKey.tr;
    orderDetail?.containerList?.forEach((element) {
      containerDetailList.add(LocalContainerDetailModel(
          price: element.price ?? "",
          type: getContainerType(element.type!)!,
          quantity: element.quantity ?? ""));
    });
  }

  void handleAddOrderFlow() {
    orderDateController.text = dateToString(DateTime.now());
    containerDetailModel = LocalContainerDetailModel(
      type: selected.value,
      price: priceController.text,
      quantity: quantityController.text,
    );
  }

  void saveDetails() {
    //conversion from one type to another tye
    var containerList = <ContainerDetailModel>[];
    for (var element in containerDetailList) {
      containerList.add(ContainerDetailModel(
          price: element.price,
          type: getContainerIndex(element.type),
          quantity: element.quantity));
    }

    var orderDetail = OrderDetailModel(
        customerName: customerNameController.text,
        customerAddress: customerAddressController.text,
        customerMobileNumber: customerNumberController.text,
        orderDate: orderDateController.text,
        paymentStatus: selectedPaymentMode.value,
        paymentDate: orderPaymentDateController.text,
        comments: commentsController.text,
        totalAmount: getTotalAmount()[0],
        key: Get.arguments,
        orderCompletedDate: orderCompleteDateController.text,
        totalQuantity: getTotalAmount()[1],
        billNumber: billNumberController.text,
        deliveryStatus: selectedDeliveryStatus.value,
        containerList: containerList);

    FireBaseDB.updateOrderDetails(orderDetail, () {
      goBack(result: orderDetail);
    });
  }
}
