import 'package:yash_oil/app/enums/enums_utils.dart';
import 'package:yash_oil/app/ui/main_controller.dart';
import 'package:yash_oil/app/ui/orderdetail/order_detail_controller.dart';
import 'package:yash_oil/app/ui/orderlist/order_list_controller.dart';

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
  var orderList = <OrderDetailModel>[];

  final RxString selectedDeliveryStatus = AppString.pendingKey.tr.obs;
  RxString selectedPaymentMode = AppString.unPaidKey.tr.obs;
  RxString toolBarTitle = AppString.addOrderDetailsKey.tr.obs;
  Rx<ContainerType> selected = ContainerType.fiveLtr.obs;
  late LocalContainerDetailModel containerDetailModel;
  RxBool isShowValidation = false.obs;
  RxList<LocalContainerDetailModel> containerDetailList =
      <LocalContainerDetailModel>[].obs;
  late OrderDetailModel? orderDetailModel;

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
  void onInit() async {
    super.onInit();
    handleEditOrderFlow();
    orderList = await FireBaseDB.getOrders();
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
    orderDetailModel = await FireBaseDB.getOrderDetails(Get.arguments);

    customerNameController.text = orderDetailModel?.customerName ?? "";
    customerAddressController.text = orderDetailModel?.customerAddress ?? "";
    customerNumberController.text =
        orderDetailModel?.customerMobileNumber ?? "";
    orderCompleteDateController.text =
        orderDetailModel?.orderCompletedDate ?? "";
    orderDateController.text = orderDetailModel?.orderDate ?? "";
    billNumberController.text = orderDetailModel?.billNumber ?? "";
    commentsController.text = orderDetailModel?.comments ?? "";
    orderPaymentDateController.text = orderDetailModel?.paymentDate ?? "";
    selectedPaymentMode.value =
        orderDetailModel?.paymentStatus ?? AppString.unPaidKey.tr;
    selectedDeliveryStatus.value =
        orderDetailModel?.deliveryStatus ?? AppString.pendingKey.tr;
    orderDetailModel?.containerList?.forEach((element) {
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
    if (orderList.firstWhereOrNull(
            (element) => element.billNumber == billNumberController.text) ==
        null) {
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
          userMail: orderDetailModel?.userMail,
          orderCompletedDate: orderCompleteDateController.text,
          totalQuantity: getTotalAmount()[1],
          billNumber: billNumberController.text,
          deliveryStatus: selectedDeliveryStatus.value,
          containerList: containerList);

      FireBaseDB.updateOrderDetails(orderDetail, () {
        Get.find<OrderDetailController>(tag: (OrderDetailController).toString())
            .update();
        Get.find<OrderListController>(tag: (OrderListController).toString())
            .update();
        goBack();
      });
    } else {
      showSnackBar(message: AppString.billNumberExistKey.tr);
    }
  }
}
