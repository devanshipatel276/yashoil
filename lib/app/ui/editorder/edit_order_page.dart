import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:yash_oil/app/ui/editorder/edit_order_controller.dart';

import '../../../util/date_utils.dart';
import '../../../util/exports.dart';
import '../../enums/enums_utils.dart';
import '../../model/container_detail_model.dart';

class EditOrderPage extends BaseGetResponsiveView<EditOrderController> {
  EditOrderPage({super.key});

  @override
  Widget buildPhoneWidget() {
    return Scaffold(
      backgroundColor: AppColors.whiteAppBarColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 8, bottom: 8),
        child: Form(
          key: controller.formKey,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: CustomTextFormField(
                  controller: controller.billNumberController,
                  label: AppString.billNumberKey.tr,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: CustomTextFormField(
                  controller: controller.customerNameController,
                  label: AppString.customerNameKey.tr,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return AppString.pleaseEnterCustomerNameKey.tr;
                    }
                  },
                ),
              ),
              CustomTextFormField(
                  controller: controller.customerAddressController,
                  label: AppString.customerAddressKey.tr,
                  maxLines: 5,
                  contentPadding: const EdgeInsets.only(
                    top: 20,
                  ),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return AppString.pleaseEnterCustomerAddressKey.tr;
                    }
                  }),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: CustomTextFormField(
                    controller: controller.customerNumberController,
                    textInputType: TextInputType.number,
                    maxLength: 10,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    label: AppString.customerMobileNumberKey.tr,
                    prefixIconConstraints: const BoxConstraints(
                        minWidth: 25,
                        minHeight: 25,
                        maxWidth: 25,
                        maxHeight: 25),
                    prefix: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: CustomTextLabel(
                        label: AppConstant.countryCode,
                        style: AppStyles.textRegular
                            .copyWith(color: AppColors.brownTextColor),
                      ),
                    ),
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return AppString.pleaseEnterCustomerNumberKey.tr;
                      } else if (value != null && !value.isValidPhoneNumber) {
                        return AppString.pleaseEnterValidCustomerNumberKey.tr;
                      }
                    }),
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
                  suffix: loadMaterialIcon(Icons.calendar_month_outlined,
                      color: AppColors.brownBackGroundColor),
                  label: AppString.orderDateKey.tr,
                ),
              ),
              addOrderView(),
              paymentView(),
              deliveryView(),
              Container(
                width: 120.0,
                margin: const EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 14.0),
                child: CustomPrimaryButton(
                    padding: const EdgeInsets.only(
                        left: 0, right: 0, top: 16, bottom: 16),
                    text: AppString.saveKey.tr,
                    textStyle: AppStyles.textMedium,
                    backgroundColor: AppColors.brownBackGroundColor,
                    onClick: () {
                      if (controller.formKey.currentState!.validate() &&
                          !controller.checkOrderDetailValidation()) {
                        controller.saveDetails();
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dropDownView(
      {required List<String> list, required RxString selection}) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.whiteAppBarColor,
          border: Border.all(color: AppColors.brownBackGroundColor),
          borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(4),
      child: DropdownButton(
          alignment: Alignment.center,
          value: selection.value,
          underline: Container(),
          isDense: true,
          icon: loadMaterialIcon(Icons.arrow_drop_down,
              color: AppColors.brownBackGroundColor),
          items: list
              .map((e) => DropdownMenuItem(
                  value: e,
                  child: CustomTextLabel(
                    label: e,
                    style: AppStyles.textRegular
                        .copyWith(color: AppColors.brownTextColor),
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
                  errorBorderColor: AppColors.brownBackGroundColor,
                  labelStyle: AppStyles.textRegular
                      .copyWith(color: AppColors.blackTextColor),
                  borderColor: AppColors.blackBackGroundColor,
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
                            errorStyle: AppStyles.textRegular
                                .copyWith(color: AppColors.brownTextColor),
                            label: AppString.quantityKey.tr,
                            style: AppStyles.textRegular
                                .copyWith(color: AppColors.blackTextColor),
                            fillColor: Colors.transparent,
                            validator: (value) {
                              if (value != null && value.isEmpty) {
                                return AppString.pleaseEnterQuantityKey.tr;
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
                              .copyWith(color: AppColors.brownTextColor),
                          style: AppStyles.textRegular
                              .copyWith(color: AppColors.blackTextColor),
                          fillColor: Colors.transparent,
                          validator: (value) {
                            if (value != null && value.isEmpty) {
                              return AppString.pleaseEnterPriceKey.tr;
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

  Widget addOrderView() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          child: Row(
            children: [
              Expanded(
                  child: CustomTextLabel(
                textAlign: TextAlign.start,
                label: AppString.addOrderDetailsKey.tr,
                style: AppStyles.textRegular
                    .copyWith(color: AppColors.brownTextColor),
              )),
              InkWell(
                onTap: () {
                  showOrderDetailDialog();
                },
                child: loadMaterialIcon(Icons.add,
                    color: AppColors.brownBackGroundColor),
              )
            ],
          ),
        ),
        Visibility(
            visible: controller.isShowValidation.value,
            child: Container(
              margin: const EdgeInsets.only(top: 4),
              child: CustomTextLabel(
                textAlign: TextAlign.start,
                style: AppStyles.textRegular
                    .copyWith(color: AppColors.lightRedColor),
                label: AppString.pleaseAddOrderDetailsKey.tr,
              ),
            )),
        Visibility(
          visible: controller.containerDetailList.isNotEmpty,
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.all(16),
            decoration: MyAppTheme.thinBorderTheme(
                borderColor: AppColors.brownBackGroundColor),
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
                  child: divider(color: AppColors.brownBackGroundColor),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 33),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTextLabel(
                          textAlign: TextAlign.start,
                          label: AppString.totalAmountKey.tr,
                          style: AppStyles.textRegular
                              .copyWith(color: AppColors.brownTextColor),
                        ),
                      ),
                      CustomTextLabel(
                        style: AppStyles.textRegular
                            .copyWith(color: AppColors.brownTextColor),
                        label: controller.getTotalAmount()[0],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget containerDetailView(LocalContainerDetailModel containerDetailModel) {
    return Row(children: [
      Expanded(
          child: CustomTextLabel(
              textAlign: TextAlign.start,
              style: AppStyles.textRegular
                  .copyWith(color: AppColors.brownTextColor),
              label: getContainerName(containerDetailModel.type))),
      CustomTextLabel(
          style:
              AppStyles.textRegular.copyWith(color: AppColors.brownTextColor),
          label:
              "${containerDetailModel.quantity} x ${containerDetailModel.price}"),
      GestureDetector(
        onTap: () {
          controller.deleteContainerDetail(containerDetailModel);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: loadMaterialIcon(Icons.delete,
              size: 18, color: AppColors.brownBackGroundColor),
        ),
      ),
    ]);
  }

  Widget paymentView() {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20, top: 20),
          child: Row(
            children: [
              Expanded(
                child: CustomTextLabel(
                    label: AppString.paymentKey.tr,
                    textAlign: TextAlign.start,
                    style: AppStyles.textRegular
                        .copyWith(color: AppColors.brownTextColor)),
              ),
              dropDownView(
                  list: controller.paymentModeList,
                  selection: controller.selectedPaymentMode),
            ],
          ),
        ),
        Visibility(
          visible:
              controller.selectedPaymentMode.value != AppString.unPaidKey.tr,
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: CustomTextFormField(
              onTap: () {
                openDatePicker(screen.context).then((value) {
                  if (value != null) {
                    controller.orderPaymentDateController.text =
                        dateToString(value);
                  }
                });
              },
              readOnly: true,
              controller: controller.orderPaymentDateController,
              suffix: loadMaterialIcon(Icons.calendar_month_outlined,
                  color: AppColors.brownBackGroundColor),
              label: AppString.paymentDateKey.tr,
              validator: (value) {
                if (controller.selectedPaymentMode.value !=
                    AppString.unPaidKey.tr) {
                  if (value != null && value.isEmpty) {
                    return AppString.pleaseEnterOrderPaymentDateKey.tr;
                  }
                }
              },
            ),
          ),
        ),
        Visibility(
          visible:
              controller.selectedPaymentMode.value == AppString.unPaidKey.tr,
          child: Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: CustomTextFormField(
              controller: controller.commentsController,
              label: AppString.commentsKey.tr,
              maxLines: 5,
              contentPadding: const EdgeInsets.only(
                top: 20,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget deliveryView() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CustomTextLabel(
                  label: AppString.deliveryStatusKey.tr,
                  textAlign: TextAlign.start,
                  style: AppStyles.textRegular
                      .copyWith(color: AppColors.brownTextColor)),
            ),
            dropDownView(
                list: controller.deliveryStatusList,
                selection: controller.selectedDeliveryStatus),
          ],
        ),
      ],
    );
  }

  @override
  String getTag() => (EditOrderController).toString();
}
