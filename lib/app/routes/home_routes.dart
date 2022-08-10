import 'package:get/get.dart';

import '../../base/authentication_middelware.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_page.dart';

class HomeRoutes {
  HomeRoutes._();

  static final routes = [
    GetPage(
      name: '/home',
      page: HomePage.new,
      binding: HomeBinding(),
      middlewares: [AuthMiddleWare()],
      transition: Transition.rightToLeft,
    ),
  ];
}
