
import 'package:get/get.dart';

import '../../base/authentication_middelware.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_page.dart';

class LoginRoutes {
  LoginRoutes._();

  static final routes = [
    GetPage(
      name: '/login',
      page: LoginPage.new,
      binding: LoginBinding(),
      middlewares: [AuthMiddleWare()],
      transition: Transition.rightToLeft,
    ),
  ];
}
