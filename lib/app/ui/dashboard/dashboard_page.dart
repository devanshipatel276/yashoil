import 'package:yash_oil/app/ui/dashboard/dashboard_controller.dart';

import '../../../util/exports.dart';
import '../orderlist/order_list_page.dart';

class DashBoardPage extends BaseGetResponsiveView<DashBoardController> {
  DashBoardPage({super.key});

  @override
  String getTag() => (DashBoardController).toString();

  @override
  Widget buildPhoneWidget() => _phoneAndTabletView();

  Widget _phoneAndTabletView() {
    return Scaffold(
        backgroundColor: AppColors.whiteBackGroundColor,
        drawer: MenuPage(),
        body: OrderListPage());
  }
}
