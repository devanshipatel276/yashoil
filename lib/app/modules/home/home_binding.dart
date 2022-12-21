import 'package:get/get.dart';

import 'home_controller.dart';

/// please use put(not LazyPut) here if you are using controller to manage state of Particular Page
/// like below, Home Controller will handle state of Home Page

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(), tag: (HomeController).toString());
  }
}
