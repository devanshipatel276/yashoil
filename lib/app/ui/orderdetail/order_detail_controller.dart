import 'package:yash_oil/app/model/order_detail_model.dart';
import 'package:yash_oil/app/ui/main_controller.dart';

import '../../../base/base_controller.dart';
import '../../../util/exports.dart';
import '../../../util/toolbar_model.dart';
import '../../enums/enums_utils.dart';
import '../../model/container_detail_model.dart';

class OrderDetailController extends BaseGetxController {
  TextEditingController orderCompleteDateController = TextEditingController();
  TextEditingController orderPaymentDateController = TextEditingController();
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
  bool isAddFlow = true;
  RxList<LocalContainerDetailModel> containerDetailList =
      <LocalContainerDetailModel>[].obs;
  OrderDetailModel? orderDetail;

  @override
  void onControllerReady() {}

  MainController? getParentController() {
    return Get.find<MainController>(tag: (MainController).toString());
  }

  @override
  void onInit() {
    super.onInit();
    handleEditOrderFlow(Get.arguments);
  }

  @override
  ToolBarModel? setUpToolbar() {
    return ToolBarModel(
        currentController: this,
        isToolBarVisible: true,
        isTitleVisible: true,
        onBackOrClose: () {
          goBack(result: orderDetail);
        },
        title: AppString.orderDetailsKey.tr,
        endView: Row(
          children: [
            GestureDetector(
              onTap: () {
                openAlertDialog(Get.context!,
                    title: AppString.deleteOrderKey.tr,
                    subTitle: AppString.deleteOrderDescriptionKey.tr,
                    cancelLabel: AppString.cancelBtnKey.tr,
                    successLabel: AppString.deleteKey.tr, onSuccess: () {
                  FireBaseDB.deleteOrder(Get.arguments);
                  goBack();
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: loadMaterialIcon(Icons.delete,
                    color: AppColors.whiteBackGroundColor),
              ),
            ),
            GestureDetector(
                onTap: () {
                  toNamed(AppPages.editOrder, arguments: Get.arguments);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: loadMaterialIcon(Icons.edit,
                      color: AppColors.whiteBackGroundColor),
                )),
          ],
        ),
        isBackVisible: true);
  }

  void handleEditOrderFlow(String path) async {
    orderDetail = await FireBaseDB.getOrderDetails(path);
    setValue();
  }

  @override
  void update([List<Object>? ids, bool condition = true]) {
    super.update(ids, condition);
    handleEditOrderFlow(Get.arguments);
  }

  void setValue() {
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
}
