import 'package:flutter/services.dart';
import 'package:yash_oil/app/ui/orderdetail/order_detail_controller.dart';

import '../../../util/exports.dart';
import '../../model/container_detail_model.dart';

class OrderDetailPage extends BaseGetResponsiveView<OrderDetailController> {
  OrderDetailPage({super.key});

  @override
  Widget buildPhoneWidget() {
    return Scaffold(
      backgroundColor: AppColors.whiteBackGroundColor,
      body: Theme(
        data: Theme.of(screen.context).copyWith(
            inputDecorationTheme: MyAppTheme.inputDecorationTheme(
          fillColor: AppColors.whiteBackGroundColor,
          errorBorderColor: AppColors.redBackGroundColor,
          labelStyle:
              AppStyles.textRegular.copyWith(color: AppColors.orangeTextColor),
          borderColor: AppColors.orangeBackGroundColor,
        )),
        child: Container(
          margin: const EdgeInsets.only(left: 30, right: 30),
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: CustomTextFormField(
                  readOnly: true,
                  label: AppString.customerNameKey.tr,
                  controller: controller.customerNameController,
                  fillColor: AppColors.whiteBackGroundColor,
                  style: AppStyles.textRegular
                      .copyWith(color: AppColors.orangeTextColor),
                ),
              ),
              CustomTextFormField(
                readOnly: true,
                fillColor: AppColors.whiteBackGroundColor,
                controller: controller.customerAddressController,
                label: AppString.customerAddressKey.tr,
                maxLines: 5,
                style: AppStyles.textRegular
                    .copyWith(color: AppColors.orangeTextColor),
                contentPadding: const EdgeInsets.only(
                  top: 20,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: CustomTextFormField(
                  readOnly: true,
                  fillColor: AppColors.whiteBackGroundColor,
                  style: AppStyles.textRegular
                      .copyWith(color: AppColors.orangeTextColor),
                  controller: controller.customerNumberController,
                  label: AppString.customerMobileNumberKey.tr,
                  prefix: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CustomTextLabel(
                      style: AppStyles.textRegular
                          .copyWith(color: AppColors.orangeTextColor),
                      label: AppConstant.countryCode,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: CustomTextFormField(
                  readOnly: true,
                  fillColor: AppColors.whiteBackGroundColor,
                  style: AppStyles.textRegular
                      .copyWith(color: AppColors.orangeTextColor),
                  controller: controller.orderDateController,
                  suffix: loadMaterialIcon(Icons.calendar_month_outlined,
                      color: AppColors.orangeBackGroundColor),
                  label: AppString.orderDateKey.tr,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: CustomTextFormField(
                  readOnly: true,
                  fillColor: AppColors.whiteBackGroundColor,
                  style: AppStyles.textRegular
                      .copyWith(color: AppColors.orangeTextColor),
                  controller: controller.billNumberController,
                  label: AppString.billNumberKey.tr,
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: CustomTextLabel(
                    textAlign: TextAlign.start,
                    style: AppStyles.textRegular
                        .copyWith(color: AppColors.orangeTextColor),
                    label: AppString.orderDetailsKey.tr,
                  )),
              Visibility(
                visible: controller.containerDetailList.isNotEmpty,
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.all(16),
                  decoration: MyAppTheme.thinBorderTheme(
                      borderColor: AppColors.orangeBackGroundColor),
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
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextLabel(
                              style: AppStyles.textRegular
                                  .copyWith(color: AppColors.orangeTextColor),
                              textAlign: TextAlign.start,
                              label: AppString.totalKey.tr,
                            ),
                          ),
                          CustomTextLabel(
                            style: AppStyles.textRegular
                                .copyWith(color: AppColors.orangeTextColor),
                            label:
                                " ${controller.getTotalAmount()[1]} x ${controller.getTotalAmount()[0]}",
                          ),
                        ],
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
                        style: AppStyles.textRegular
                            .copyWith(color: AppColors.orangeTextColor),
                        label: AppString.paymentKey.tr,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    CustomTextLabel(
                      style: AppStyles.textRegular
                          .copyWith(color: AppColors.orangeTextColor),
                      label: controller.selectedPaymentMode.value,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomTextLabel(
                        style: AppStyles.textRegular
                            .copyWith(color: AppColors.orangeTextColor),
                        label: AppString.deliveryStatusKey.tr,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    CustomTextLabel(
                      style: AppStyles.textRegular
                          .copyWith(color: AppColors.orangeTextColor),
                      label: controller.selectedDeliveryStatus.value,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: controller.selectedDeliveryStatus.value ==
                    AppString.deliveredKey.tr,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: CustomTextFormField(
                    readOnly: true,
                    fillColor: AppColors.whiteBackGroundColor,
                    style: AppStyles.textRegular
                        .copyWith(color: AppColors.orangeTextColor),
                    controller: controller.orderCompleteDateController,
                    suffix: loadMaterialIcon(Icons.calendar_month_outlined,
                        color: AppColors.orangeBackGroundColor),
                    label: AppString.completedDateKey.tr,
                  ),
                ),
              ),
              Visibility(
                visible: controller.selectedPaymentMode.value ==
                    AppString.unPaidKey.tr,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 32),
                  child: CustomTextFormField(
                    controller: controller.commentsController,
                    label: AppString.commentsKey.tr,
                    maxLines: 5,
                    readOnly: true,
                    fillColor: AppColors.whiteBackGroundColor,
                    style: AppStyles.textRegular
                        .copyWith(color: AppColors.orangeTextColor),
                    contentPadding: const EdgeInsets.only(
                      top: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget containerDetailView(LocalContainerDetailModel containerDetailModel) {
    return Row(children: [
      Expanded(
          child: CustomTextLabel(
              style: AppStyles.textRegular
                  .copyWith(color: AppColors.orangeTextColor),
              textAlign: TextAlign.start,
              label: getContainerName(containerDetailModel.type))),
      CustomTextLabel(
          style:
              AppStyles.textRegular.copyWith(color: AppColors.orangeTextColor),
          label:
              "${containerDetailModel.quantity} x ${containerDetailModel.price}"),
    ]);
  }

  @override
  String getTag() => (OrderDetailController).toString();
}
