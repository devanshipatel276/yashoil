import 'package:yash_oil/app/ui/splash/splash_controller.dart';

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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          CustomTextLabel(
            label: AppString.yashOil.tr,
            style: AppStyles.textDoubleExtraLargeMTSans,
            maxLines: 2,
          ),
          const SizedBox(
            height: 11.0,
          ),
          // CustomTextLabel(
          //   label: AppString.helloEveryBodyKey.tr,
          //   style: AppStyles.textExtraLarge,
          //   maxLines: 1,
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
