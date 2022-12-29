import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yash_oil/app/core/config/app_string.dart';
import 'package:yash_oil/app/core/config/db/firebase_db.dart';
import 'package:yash_oil/app/core/theme/app_colors.dart';
import 'package:yash_oil/app/core/widgets/custom_text_form_field.dart';
import 'package:yash_oil/app/core/widgets/custom_text_label.dart';
import 'package:yash_oil/app/ui/addorder/add_order_controller.dart';
import 'package:yash_oil/util/common_widget.dart';
import 'package:yash_oil/util/exports.dart';

import '../../../base/base_responsive_view.dart';
import '../../../util/date_utils.dart';
import '../../core/theme/app_styles.dart';

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
                        showOrderDetailDialog(
                            screen.context,
                            controller.orderDetailList,
                            controller.quantityController,
                            controller.priceController);
                      },
                      child: loadMaterialIcon(Icons.add,
                          color: AppColors.whiteBackGroundColor),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
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
}
