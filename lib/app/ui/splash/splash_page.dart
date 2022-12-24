import 'package:yash_oil/app/ui/splash/splash_controller.dart';
import 'package:yash_oil/util/common_widget.dart';

import '../../../base/base_responsive_view.dart';
import '../../../util/exports.dart';
import '../../core/widgets/custom_text_label.dart';

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 60),
            child: CustomTextLabel(
              label: AppString.yashOil.tr,
              style: AppStyles.textDoubleExtraLargeMTSans,
              maxLines: 2,
            ),
          ),
          CustomTextLabel(
            label: AppString.tag.tr,
            style: AppStyles.textExtraLarge,
            maxLines: 1,
          ),
          Expanded(child: Container()),
          loadAsset(path: Assets.image.peanutOil.path),
          Expanded(child: Container()),

          //       path: Assets.svgs.icSplashFriends,
          //       size: const Size(double.infinity, 232)),
          // ),
          // Container(
          //   margin: const EdgeInsets.only(bottom: 89.0, top: 123),
          //   // color: Colors.white,
          //   child: loadSvg(
          //       path: Assets.svgs.icSplashFriends,
          //       size: const Size(double.infinity, 232)),
          // ),
        ],
      ),
    );
  }
}
