import 'package:yash_oil/app/ui/menu/menu_controller.dart';

import '../../../util/exports.dart';
import 'menu_model.dart';

class MenuPage extends BaseGetResponsiveView<MenuController> {
  MenuPage({super.key});

  @override
  String getTag() => (MenuController).toString();

  @override
  Widget buildPhoneWidget() => _phoneAndTabletView();

  Widget _phoneAndTabletView() {
    return Obx(() {
      return Scaffold(
        backgroundColor: AppColors.orangeBackGroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            menuListWidget(),
            Container(
              height: 48,
              width: 126,
              margin: const EdgeInsets.fromLTRB(20.0, 0.0, 27.0, 25.0),
              child: CustomPrimaryButton(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                text: AppString.logOutKey.tr,
                textStyle: AppStyles.textRegular.copyWith(
                  color: AppColors.redTextColor,
                ),
                onClick: () {
                  openAlertDialog(screen.context,
                      title: AppString.logOutKey.tr,
                      subTitle: AppString.logoutDescriptionKey.tr,
                      successLabel: AppString.logOutKey.tr,
                      cancelLabel: AppString.cancelBtnKey.tr,
                      subTitlePadding: EdgeInsets.zero, onSuccess: () {
                    controller.handleLogOut();
                  });
                  // controller.btnLogOutClicked(screen.context);
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget menuListWidget() {
    return Expanded(
      child: ListView.builder(
          itemCount: controller.menuList.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          itemBuilder: ((context, index) {
            MenuModel menuData = controller.menuList[index];
            return ListTile(
              contentPadding: const EdgeInsets.fromLTRB(20.0, 0.0, 27.0, 0.0),
              minLeadingWidth: 0.0,
              minVerticalPadding: 0.0,
              horizontalTitleGap: 11.0,
              leading: loadSvg(
                path: menuData.imagePath,
                size: const Size(18.0, 18.0),
              ),
              title: CustomTextLabel(
                label: menuData.title,
                textAlign: TextAlign.start,
                style: AppStyles.textRegular,
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 20.0,
                color: AppColors.whiteBackGroundColor,
              ),
              onTap: () {
                controller.handleClick(menuData.menuType);
              },
            );
          })),
    );
  }
}
