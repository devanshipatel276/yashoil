import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:yash_oil/app/ui/addorder/add_order_controller.dart';
import 'package:yash_oil/util/exports.dart';

import '../../../util/date_utils.dart';
import '../../enums/enums_utils.dart';
import '../../model/container_detail_model.dart';

class AddOrderPage extends BaseGetResponsiveView<AddOrderController> {
  AddOrderPage({super.key});

  @override
  Widget buildPhoneWidget() {
    return Scaffold(
      backgroundColor: AppColors.orangeBackGroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 8, bottom: 8),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              CustomTextFormField(
                controller: controller.customerNameController,
                label: AppString.customerNameKey.tr,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: CustomTextFormField(
                  controller: controller.customerAddressController,
                  label: AppString.customerAddressKey.tr,
                  maxLines: 5,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: CustomTextFormField(
                  controller: controller.customerNumberController,
                  label: AppString.customerMobileNumberKey.tr,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: CustomTextFormField(
                  onTap: () {
                    openDatePicker(screen.context).then((value) {
                      if (value != null) {
                        controller.orderDateController.text =
                            dateToString(value);
                      }
                    });
                  },
                  readOnly: true,
                  controller: controller.orderDateController,
                  suffix: loadMaterialIcon(Icons.calendar_today),
                  label: AppString.orderDateKey.tr,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: CustomTextFormField(
                  controller: controller.billNumberController,
                  label: AppString.billNumberKey.tr,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: CustomTextLabel(
                      textAlign: TextAlign.start,
                      label: AppString.addOrderDetailsKey.tr,
                    )),
                    InkWell(
                      onTap: () {
                        showOrderDetailDialog();
                      },
                      child: loadMaterialIcon(Icons.add),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: controller.containerDetailList.isNotEmpty,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.whiteAppBarColor,
                      ),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return containerDetailView(
                              controller.containerDetailList[index]);
                        },
                        itemCount: controller.containerDetailList.length,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                        child: divider(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 26),
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomTextLabel(
                                textAlign: TextAlign.start,
                                label: AppString.totalAmountKey.tr,
                              ),
                            ),
                            CustomTextLabel(
                              label: controller.getTotalAmount(),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20, top: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextLabel(
                        label: AppString.paymentKey.tr,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    dropDownView(
                        list: controller.paymentModeList,
                        selection: controller.selectedPaymentMode),
                  ],
                ),
              ),
              Visibility(
                visible: controller.selectedPaymentMode.value ==
                    AppString.unPaidKey.tr,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: CustomTextFormField(
                    controller: controller.commentsController,
                    label: AppString.commentsKey.tr,
                    maxLines: 5,
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextLabel(
                      label: AppString.deliveryStatusKey.tr,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  dropDownView(
                      list: controller.deliveryStatusList,
                      selection: controller.selectedDeliveryStatus),
                ],
              ),
              Visibility(
                visible: controller.selectedDeliveryStatus.value ==
                    AppString.deliveredKey.tr,
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: CustomTextFormField(
                    onTap: () {
                      openDatePicker(screen.context).then((value) {
                        if (value != null) {
                          controller.orderCompleteDateController.text =
                              dateToString(value);
                        }
                      });
                    },
                    readOnly: true,
                    controller: controller.orderCompleteDateController,
                    suffix: loadMaterialIcon(Icons.calendar_today),
                    label: AppString.completedDateKey.tr,
                  ),
                ),
              ),
              Container(
                width: 120.0,
                margin: const EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 14.0),
                child: CustomPrimaryButton(
                    padding: const EdgeInsets.only(
                        left: 0, right: 0, top: 16, bottom: 16),
                    text: AppString.saveKey.tr,
                    textStyle: AppStyles.textMedium.copyWith(
                      color: AppColors.redTextColor,
                    ),
                    onClick: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  String getTag() => (AddOrderController).toString();

  Widget dropDownView(
      {required List<String> list, required RxString selection}) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.whiteBackGroundColor,
          border: Border.all(color: AppColors.whiteAppBarColor),
          borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(4),
      child: DropdownButton(
          alignment: Alignment.center,
          value: selection.value,
          underline: Container(),
          isDense: true,
          icon: loadMaterialIcon(Icons.arrow_drop_down,
              color: AppColors.orangeBackGroundColor),
          items: list
              .map((e) => DropdownMenuItem(
                  value: e,
                  child: CustomTextLabel(
                    label: e,
                    style: AppStyles.textRegular
                        .copyWith(color: AppColors.orangeTextColor),
                  )))
              .toList(),
          onChanged: (e) {
            selection.value = e!;
          }),
    );
  }

  showOrderDetailDialog() {
    controller.quantityController.text = "";
    controller.priceController.text = "";
    controller.selected.value = ContainerType.fiveLtr;
    return showDialog(
        context: screen.context,
        barrierDismissible: true,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: CustomTextLabel(
                label: AppString.orderDetailsKey.tr,
                style: AppStyles.textMediumSPPro.copyWith(
                    color: AppColors.blackTextColor,
                    fontSize: Dimens.fontSize16),
              ),
              content: Theme(
                data: Theme.of(context).copyWith(
                    inputDecorationTheme: MyAppTheme.inputDecorationTheme(
                  fillColor: AppColors.transparent,
                  labelStyle: AppStyles.textRegular
                      .copyWith(color: AppColors.blackTextColor),
                  errorStyle: AppStyles.textRegular
                      .copyWith(color: AppColors.redTextColor),
                  borderColor: AppColors.blackBackGroundColor,
                  errorBorderColor: AppColors.redBackGroundColor,
                )),
                child: Obx(
                  () => Form(
                    key: controller.dialogFormKey,
                    child: Column(
                      children: [
                        radioView(
                            value: ContainerType.fiveLtr,
                            selection: controller.selected.value,
                            label: AppString.fiveLtrKey.tr,
                            onChanged: (value) {
                              controller.selected.value = value!;
                            }),
                        radioView(
                            value: ContainerType.fifteenLtrTin,
                            selection: controller.selected.value,
                            label: AppString.fifteenLtrTinKey.tr,
                            onChanged: (value) {
                              controller.selected.value = value!;
                            }),
                        radioView(
                            value: ContainerType.fifteenLtrPlastic,
                            selection: controller.selected.value,
                            label: AppString.fifteenLtrPlasticKey.tr,
                            onChanged: (value) {
                              controller.selected.value = value!;
                            }),
                        radioView(
                            value: ContainerType.fifteenKgTin,
                            selection: controller.selected.value,
                            label: AppString.fifteenKgTinKey.tr,
                            onChanged: (value) {
                              controller.selected.value = value!;
                            }),
                        radioView(
                            value: ContainerType.fifteenKgPlastic,
                            selection: controller.selected.value,
                            label: AppString.fifteenKgPlasticKey.tr,
                            onChanged: (value) {
                              controller.selected.value = value!;
                            }),
                        Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 8),
                          child: CustomTextFormField(
                            controller: controller.quantityController,
                            cursorColor: AppColors.blackBackGroundColor,
                            textInputType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            label: AppString.quantityKey.tr,
                            style: AppStyles.textRegular
                                .copyWith(color: AppColors.blackTextColor),
                            fillColor: Colors.transparent,
                            errorStyle: AppStyles.textRegular
                                .copyWith(color: AppColors.redTextColor),
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return AppString.pleaseEnterQuantityKey.tr;
                              } else {
                                return null;
                              }
                            },
                          ),
                        ),
                        CustomTextFormField(
                          controller: controller.priceController,
                          cursorColor: AppColors.blackBackGroundColor,
                          label: AppString.priceKey.tr,
                          textInputType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          errorStyle: AppStyles.textRegular
                              .copyWith(color: AppColors.redTextColor),
                          style: AppStyles.textRegular
                              .copyWith(color: AppColors.blackTextColor),
                          fillColor: Colors.transparent,
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return AppString.pleaseEnterPriceKey.tr;
                            } else {
                              return null;
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
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
                    if (controller.dialogFormKey.currentState!.validate()) {
                      controller.addContainerDetail();
                    }
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

  Widget containerDetailView(LocalContainerDetailModel containerDetailModel) {
    return Row(children: [
      Expanded(
          child: CustomTextLabel(
              textAlign: TextAlign.start,
              label: getContainerName(containerDetailModel.type))),
      CustomTextLabel(
          label:
              "${containerDetailModel.quantity} x ${containerDetailModel.price}"),
      GestureDetector(
        onTap: () {
          controller.deleteContainerDetail(containerDetailModel);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: loadMaterialIcon(Icons.delete, size: 18),
        ),
      ),
    ]);
  }
}
