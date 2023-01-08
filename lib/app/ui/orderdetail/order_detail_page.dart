import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yash_oil/app/ui/orderdetail/order_detail_controller.dart';

import '../../../util/exports.dart';
import '../../model/container_detail_model.dart';

class OrderDetailPage extends BaseGetResponsiveView<OrderDetailController> {
  OrderDetailPage({super.key});

  @override
  Widget buildPhoneWidget() {
    return WillPopScope(
      onWillPop: () async {
        goBack(result: controller.orderDetail);
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColors.whiteBackGroundColor,
        body: Theme(
          data: Theme.of(screen.context).copyWith(
              inputDecorationTheme: MyAppTheme.inputDecorationTheme(
            fillColor: AppColors.whiteBackGroundColor,
            errorBorderColor: AppColors.brownBackGroundColor,
            labelStyle:
                AppStyles.textRegular.copyWith(color: AppColors.brownTextColor),
            borderColor: AppColors.brownBackGroundColor,
          )),
          child: Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: CustomTextFormField(
                    readOnly: true,
                    fillColor: AppColors.whiteBackGroundColor,
                    style: AppStyles.textRegular
                        .copyWith(color: AppColors.brownTextColor),
                    controller: controller.billNumberController,
                    label: AppString.billNumberKey.tr,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, bottom: 20),
                  child: CustomTextFormField(
                    readOnly: true,
                    label: AppString.customerNameKey.tr,
                    controller: controller.customerNameController,
                    fillColor: AppColors.whiteBackGroundColor,
                    style: AppStyles.textRegular
                        .copyWith(color: AppColors.brownTextColor),
                  ),
                ),
                CustomTextFormField(
                  readOnly: true,
                  fillColor: AppColors.whiteBackGroundColor,
                  controller: controller.customerAddressController,
                  label: AppString.customerAddressKey.tr,
                  maxLines: 5,
                  style: AppStyles.textRegular
                      .copyWith(color: AppColors.brownTextColor),
                  contentPadding: const EdgeInsets.only(
                    top: 20,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: CustomTextFormField(
                    onTap: () async {
                      var url =
                          "${AppConstant.countryCode} ${controller.customerNumberController.text}";
                      final Uri launchUri = Uri(
                        scheme: 'tel',
                        path: url,
                      );
                      await launchUrl(launchUri);
                    },
                    readOnly: true,
                    fillColor: AppColors.whiteBackGroundColor,
                    style: AppStyles.textRegular
                        .copyWith(color: AppColors.brownTextColor),
                    controller: controller.customerNumberController,
                    label: AppString.customerMobileNumberKey.tr,
                    prefixIconConstraints: const BoxConstraints(
                        minWidth: 25,
                        minHeight: 25,
                        maxWidth: 25,
                        maxHeight: 25),
                    prefix: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: CustomTextLabel(
                        style: AppStyles.textRegular
                            .copyWith(color: AppColors.brownTextColor),
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
                        .copyWith(color: AppColors.brownTextColor),
                    controller: controller.orderDateController,
                    suffix: loadMaterialIcon(Icons.calendar_month_outlined,
                        color: AppColors.brownBackGroundColor),
                    label: AppString.orderDateKey.tr,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: CustomTextLabel(
                      textAlign: TextAlign.start,
                      style: AppStyles.textRegular
                          .copyWith(color: AppColors.brownTextColor),
                      label: AppString.orderDetailsKey.tr,
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
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextLabel(
                                style: AppStyles.textRegular
                                    .copyWith(color: AppColors.brownTextColor),
                                textAlign: TextAlign.start,
                                label: AppString.totalAmountKey.tr,
                              ),
                            ),
                            CustomTextLabel(
                              style: AppStyles.textRegular
                                  .copyWith(color: AppColors.brownTextColor),
                              label: " ${controller.getTotalAmount()[0]}",
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
                              .copyWith(color: AppColors.brownTextColor),
                          label: AppString.paymentKey.tr,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      CustomTextLabel(
                        style: AppStyles.textRegular
                            .copyWith(color: AppColors.brownTextColor),
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
                              .copyWith(color: AppColors.brownTextColor),
                          label: AppString.deliveryStatusKey.tr,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      CustomTextLabel(
                        style: AppStyles.textRegular
                            .copyWith(color: AppColors.brownTextColor),
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
                          .copyWith(color: AppColors.brownTextColor),
                      controller: controller.orderCompleteDateController,
                      suffix: loadMaterialIcon(Icons.calendar_month_outlined,
                          color: AppColors.brownBackGroundColor),
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
                          .copyWith(color: AppColors.brownTextColor),
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
      ),
    );
  }

  Widget containerDetailView(LocalContainerDetailModel containerDetailModel) {
    return Row(children: [
      Expanded(
          child: CustomTextLabel(
              style: AppStyles.textRegular
                  .copyWith(color: AppColors.brownTextColor),
              textAlign: TextAlign.start,
              label: getContainerName(containerDetailModel.type))),
      CustomTextLabel(
          style:
              AppStyles.textRegular.copyWith(color: AppColors.brownTextColor),
          label:
              "${containerDetailModel.quantity} x ${containerDetailModel.price}"),
    ]);
  }

  @override
  String getTag() => (OrderDetailController).toString();
}
