import '../../../util/exports.dart';
import '../../enums/enums_utils.dart';
import 'order_list_controller.dart';

class OrderListPage extends BaseGetResponsiveView<OrderListController> {
  OrderListPage({super.key});

  @override
  String getTag() => (OrderListController).toString();

  @override
  Widget buildPhoneWidget() => _phoneAndTabletView();

  Widget _phoneAndTabletView() {
    return Scaffold(
        backgroundColor: AppColors.whiteBackGroundColor,
        body: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  controller.toNamed(AppPages.orderDetail,
                      arguments: controller.orderList[index].key);
                },
                child: listItem(index));
          },
          itemCount: controller.orderList.length,
        ));
  }

  Widget listItem(int index) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      shadowColor: AppColors.lightGrayBackGroundColor.withOpacity(0.6),
      color: AppColors.whiteBackGroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: 8.borderRadius,
          side: BorderSide(
              color: getColor(controller.orderList[index].deliveryStatus))),
      // shadowColor: AppColors.whi,
      child: Container(
        // color: AppColors.orangeBackGroundColor.withOpacity(0.1),
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: iconTitleView(
                            color: getColor(
                                controller.orderList[index].deliveryStatus),
                            path: Assets.svg.icUser,
                            isSvg: true,
                            title: controller.orderList[index].customerName),
                      ),
                      showStatus(controller.orderList[index].deliveryStatus)
                    ],
                  ),
                  iconTitleView(
                      path: Assets.svg.icPhone,
                      isSvg: true,
                      color:
                          getColor(controller.orderList[index].deliveryStatus),
                      title: controller.orderList[index].customerMobileNumber),
                  iconTitleView(
                      // path: Icons.watch_later_outlined,
                      path: Icons.beenhere_rounded,
                      color:
                          getColor(controller.orderList[index].deliveryStatus),
                      isSvg: false,
                      title: "27/06/2022"),
                  iconTitleView(
                      path: Icons.maps_home_work_rounded,
                      isSvg: false,
                      color:
                          getColor(controller.orderList[index].deliveryStatus),
                      title: controller.orderList[index].customerAddress),
                  iconTitleView(
                      path: Icons.message,
                      isSvg: false,
                      color:
                          getColor(controller.orderList[index].deliveryStatus),
                      title: controller.orderList[index].comments),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget iconTitleView(
      {required dynamic path,
      required isSvg,
      required String? title,
      Color color = AppColors.orangeBackGroundColor}) {
    double iconSize = 18;
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: iconSize,
              height: iconSize,
              child: isSvg
                  ? loadSvg(
                      path: path, size: Size(iconSize, iconSize), color: color)
                  : loadMaterialIcon(path, size: iconSize, color: color)),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: CustomTextLabel(
                  style: AppStyles.textRegular.copyWith(color: color),
                  textAlign: TextAlign.start,
                  maxLines: 4,
                  label: title ?? ""),
            ),
          )
        ],
      ),
    );
  }

  Widget showStatus(String? status) {
    return Visibility(
      visible: status.isNotNullOrEmpty,
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 16,
        color: getColor(status),
        shape: RoundedRectangleBorder(
            borderRadius: 32.borderRadius,
            side: BorderSide(color: getColor(status))),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 6.0, bottom: 6.0),
          child: CustomTextLabel(
            label: status ?? "",
            style: AppStyles.textRegular.copyWith(
              color: AppColors.whiteTextColor,
            ),
          ),
        ),
      ),
    );
  }

  Color getColor(status) {
    Color color = Colors.green;

    switch (getOrderStatus(status)) {
      case OrderStatus.pending:
        color = AppColors.yellowBackGroundColor;
        break;
      case OrderStatus.delivered:
        color = AppColors.greenBackGroundColor;
        break;
    }
    return color;
  }
}
