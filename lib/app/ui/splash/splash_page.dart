import 'package:yash_oil/app/ui/splash/splash_controller.dart';

import '../../../util/exports.dart';

class SplashPage extends BaseGetResponsiveView<SplashController> {
  SplashPage({super.key});

  @override
  String getTag() => (SplashController).toString();

  @override
  Widget buildPhoneWidget() => _phoneAndTabletView();

  Widget _phoneAndTabletView() {
    return Scaffold(
      backgroundColor: AppColors.orangeBackGroundColor,
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 60),
            child: CustomTextLabel(
              label: AppString.yashOil.tr,
              style: AppStyles.textDoubleExtraLargeMTSans,
              maxLines: 2,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: CustomTextLabel(
              label: "INDUSTRIES",
              style: AppStyles.textExtraLarge.copyWith(letterSpacing: 2.6),
              maxLines: 1,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 6),
            child: CustomTextLabel(
              label: AppString.tag.tr,
              style: AppStyles.textSmall.copyWith(fontStyle: FontStyle.italic),
              maxLines: 1,
            ),
          ),
          Expanded(child: Container()),
          Expanded(
              flex: 2, child: loadMaterialIcon(Icons.water_drop, size: 250)),
          Expanded(flex: 2, child: Container())
        ],
      ),
    );
  }
}
