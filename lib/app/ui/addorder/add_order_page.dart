import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yash_oil/app/core/config/app_string.dart';
import 'package:yash_oil/app/core/config/db/firebase_db.dart';
import 'package:yash_oil/app/core/theme/app_colors.dart';
import 'package:yash_oil/app/core/widgets/custom_text_form_field.dart';
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
        padding: const EdgeInsets.all(40),
        child: ListView(
          children: [
            CustomTextFormField(
              onTap: () {
                openDatePicker(screen.context).then((value) {
                  if (value != null) {
                    controller.dateController.text = dateToString(value);
                  }
                });
              },
              readOnly: true,
              controller: controller.dateController,
              suffix: loadMaterialIcon(Icons.calendar_today),
              label: AppString.orderDateKey.tr,
            ),
          ],
        ),
      ),
    );
  }

  @override
  String getTag() => (AddOrderController).toString();
}
