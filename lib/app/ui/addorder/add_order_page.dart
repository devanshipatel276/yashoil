import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yash_oil/app/core/config/app_string.dart';
import 'package:yash_oil/app/core/config/db/firebase_db.dart';
import 'package:yash_oil/app/core/theme/app_colors.dart';
import 'package:yash_oil/app/core/widgets/custom_text_form_field.dart';
import 'package:yash_oil/app/core/widgets/custom_text_label.dart';
import 'package:yash_oil/app/ui/addorder/add_order_controller.dart';
import 'package:yash_oil/util/common_widget.dart';

import '../../../base/base_responsive_view.dart';
import '../../../util/date_utils.dart';

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
              Container(
                margin: const EdgeInsets.only(top: 20),
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
                            ["5 ltr", "15 Kg Tin", "15 kg Plastic"],
                            controller.quantityController);
                      },
                      child: loadMaterialIcon(Icons.add,
                          color: AppColors.whiteBackGroundColor),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  String getTag() => (AddOrderController).toString();
}
