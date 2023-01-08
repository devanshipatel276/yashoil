import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yash_oil/app/model/order_detail_model.dart';
import 'package:yash_oil/app/ui/main_controller.dart';

import '../../../base/base_controller.dart';
import '../../../util/exports.dart';
import '../../../util/toolbar_model.dart';

class OrderListController extends BaseGetxController {
  var orderList = <OrderDetailModel>[].obs;
  var isFromApi = false;

  @override
  void onControllerReady() {}

  MainController? getParentController() {
    return Get.find<MainController>(tag: (MainController).toString());
  }

  @override
  void onInit() async {
    super.onInit();
    final docRef = FirebaseFirestore.instance.collection(AppConstant.orderPath);
    docRef.snapshots().listen(
      (event) {
        update();
      },
      onError: (error) => print("Listen failed: $error"),
    );

    isShowInternalAppBar.value = false;
    orderList.value = await FireBaseDB.getOrders();
    if (orderList.isEmpty) {
      isFromApi = true;
    }
  }

  @override
  void update([List<Object>? ids, bool condition = true]) async {
    super.update(ids, condition);
    orderList.value = await FireBaseDB.getOrders();
    if (orderList.isEmpty) {
      isFromApi = true;
    }
  }

  @override
  ToolBarModel? setUpToolbar() {
    return ToolBarModel(
        currentController: this,
        appBarColor: AppColors.brownBackGroundColor,
        isToolBarVisible: true,
        isLogoVisible: true,
        isDrawerRequired: true,
        endView: GestureDetector(
            onTap: () {},
            child: Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: loadMaterialIcon(Icons.filter_alt,
                  color: AppColors.whiteBackGroundColor),
            )));
  }
}
