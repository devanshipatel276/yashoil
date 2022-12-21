import 'package:yash_oil/app/ui/splash/splash_controller.dart';

import '../../../util/exports.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController(), tag: (SplashController).toString());
  }
}
