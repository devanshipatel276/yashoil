import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:yash_oil/app/model/order_detail_model.dart';
import 'package:yash_oil/app/ui/main_controller.dart';

import '../../../base/base_controller.dart';
import '../../../util/exports.dart';
import '../../../util/toolbar_model.dart';

class OrderListController extends BaseGetxController {
  var orderList = <OrderDetailModel>[].obs;
  var isFromApi = false;
  var isFilterApplied = false.obs;
  var selectFilterOption = 0.obs;
  var selectPaymentOption = 0.obs;
  var selectOrderStatus = 0.obs;
  var selectOrderTakenBy = 0.obs;
  var removeOption = RadioSelection(AppString.removeFilterKey.tr, 3);

  var filterList = [
    RadioSelection(AppString.filterByPaymentKey.tr, 0),
    RadioSelection(AppString.filterByOrderStatusKey.tr, 1),
    RadioSelection(AppString.filterByOrderTakenByKey.tr, 2),
  ];
  var paymentFilterList = [
    RadioSelection(AppString.unPaidKey.tr, 0),
    RadioSelection(AppString.onlineKey.tr, 1),
    RadioSelection(AppString.cashKey.tr, 2),
  ];
  var orderStatusFilterList = [
    RadioSelection(AppString.deliveredKey.tr, 0),
    RadioSelection(AppString.pendingKey.tr, 1),
  ];
  var orderTakenFilterList = [
    RadioSelection(AppString.yashKey.tr, 0),
    RadioSelection(AppString.darshanKey.tr, 1),
  ];

  @override
  void onControllerReady() {}

  MainController? getParentController() {
    return Get.find<MainController>(tag: (MainController).toString());
  }

  @override
  void onInit() async {
    super.onInit();
    isShowInternalAppBar.value = false;

    isFilterApplied.listen((p0) {
      update();
    });

    final docRef = FirebaseFirestore.instance.collection(AppConstant.orderPath);
    docRef.snapshots().listen(
      (event) {
        update();
      },
      onError: (error) => print("Listen failed: $error"),
    );
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
            onTap: () {
              if (isFilterApplied.value) {
                if (!filterList.contains(removeOption)) {
                  filterList.add(removeOption);
                }
              } else {
                if (filterList.contains(removeOption)) {
                  filterList.remove(removeOption);
                }
              }
              filterView();
            },
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: loadMaterialIcon(Icons.filter_alt,
                      size: 30, color: AppColors.whiteBackGroundColor),
                ),
                Visibility(
                  visible: isFilterApplied.value,
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 26, right: 9),
                      height: 6,
                      width: 6,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                          color: AppColors.brownAppBarColor,
                          border: Border.all(color: AppColors.brownAppBarColor),
                          borderRadius: BorderRadius.circular(32))),
                )
              ],
            )));
  }

  filterView() {
    if (!isFilterApplied.value) {
      selectFilterOption.value = 0;
      selectPaymentOption.value = 0;
      selectOrderStatus.value = 0;
      selectOrderTakenBy.value = 0;
    }
    filterPopUp(
        onSuccess: () {
          handleFilterSelection();
        },
        list: filterList,
        selection: selectFilterOption,
        title: AppString.filterOptionKey.tr,
        onChange: (value) {
          if (value == 0) {
            filterPopUp(
                onSuccess: () {
                  goBack();
                },
                list: paymentFilterList,
                selection: selectPaymentOption,
                title: AppString.paymentModeKey.tr,
                onChange: (int) {});
          }
          if (value == 1) {
            filterPopUp(
                onSuccess: () {
                  goBack();
                },
                list: orderStatusFilterList,
                selection: selectOrderStatus,
                title: AppString.deliveryStatusKey.tr,
                onChange: (int) {});
          }
          if (value == 2) {
            filterPopUp(
                onSuccess: () {
                  goBack();
                },
                list: orderTakenFilterList,
                selection: selectOrderTakenBy,
                title: AppString.orderTakeByKey.tr,
                onChange: (int) {});
          }
        });
  }

  filterPopUp(
      {required Function() onSuccess,
      required Function(int) onChange,
      Function()? onCancel,
      required List<RadioSelection> list,
      required RxInt selection,
      required String title}) {
    showDialog(
        context: Get.context!,
        barrierDismissible: true,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: CustomTextLabel(
                label: title,
                style: AppStyles.textMediumSPPro.copyWith(
                    color: AppColors.blackTextColor,
                    fontSize: Dimens.fontSize16),
              ),
              content: Theme(
                  data: Theme.of(context).copyWith(
                      inputDecorationTheme: MyAppTheme.inputDecorationTheme(
                    fillColor: AppColors.transparent,
                    errorBorderColor: AppColors.brownBackGroundColor,
                    labelStyle: AppStyles.textRegular
                        .copyWith(color: AppColors.blackTextColor),
                    borderColor: AppColors.blackBackGroundColor,
                  )),
                  child: Obx(() => Column(
                          children: showRadioView(list, selection, (value) {
                        onChange.call(value);
                      })))),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    goBack();
                  },
                  child: CustomTextLabel(
                    label: AppString.cancelBtnKey.tr,
                    style: AppStyles.textRegularSPPro.copyWith(
                        color: AppColors.dialogTextColor,
                        fontSize: Dimens.fontSize16),
                  ),
                ),
                CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    onSuccess.call();
                  },
                  child: CustomTextLabel(
                    label: AppString.saveKey.tr,
                    style: AppStyles.textRegularSPPro.copyWith(
                        color: AppColors.dialogTextColor,
                        fontSize: Dimens.fontSize16),
                  ),
                ),
              ],
            ));
  }

  List<Widget> showRadioView(
      List<RadioSelection> list, RxInt selection, Function(int) onChange) {
    var radioList = <Widget>[];
    for (var element in list) {
      radioList.add(radioView(
          value: element.group,
          selection: selection.value,
          label: element.title,
          onChanged: (value) {
            selection.value = value;
            onChange.call(value);
          }));
    }
    return radioList;
  }

  void handleFilterSelection() async {
    isFilterApplied.value = true;

    if (filterList[selectFilterOption.value].title ==
        AppString.filterByPaymentKey.tr) {
      orderList.value = await FireBaseDB.getOrderByFilter(
          "payment_status", paymentFilterList[selectPaymentOption.value].title);
    } else if (filterList[selectFilterOption.value].title ==
        AppString.filterByOrderStatusKey.tr) {
      orderList.value = await FireBaseDB.getOrderByFilter("delivery_status",
          orderStatusFilterList[selectOrderStatus.value].title);
    } else if (filterList[selectFilterOption.value].title ==
        AppString.filterByOrderTakenByKey.tr) {
      orderList.value = await FireBaseDB.getOrderByFilter(
          "user_email",
          orderTakenFilterList[selectOrderTakenBy.value].title ==
                  AppString.yashKey.tr
              ? AppConstant.yashEmail
              : AppConstant.darshanEmail);
    } else {
      orderList.value = await FireBaseDB.getOrders();
      isFilterApplied.value = false;
    }
    if (orderList.isEmpty) {
      isFromApi = true;
    }

    goBack();
  }
}

class RadioSelection {
  String title;
  int group;

  RadioSelection(this.title, this.group);
}
