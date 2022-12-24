import 'package:yash_oil/app/ui/editorder/edit_order_controller.dart';

import '../../../util/exports.dart';

class EditOrderPage extends BaseGetResponsiveView<EditOrderController> {
  EditOrderPage({super.key});

  @override
  Widget buildPhoneWidget() {
    return Container();
  }

  @override
  String getTag() => (EditOrderController).toString();
}
