import 'package:flutter/cupertino.dart';
import 'package:yash_oil/app/ui/addorder/add_order_controller.dart';

import '../../../base/base_responsive_view.dart';

class AddOrderPage extends BaseGetResponsiveView<AddOrderController> {
  AddOrderPage({super.key});

  @override
  Widget buildPhoneWidget() {
    return Container();
  }

  @override
  String getTag() => (AddOrderController).toString();
}
