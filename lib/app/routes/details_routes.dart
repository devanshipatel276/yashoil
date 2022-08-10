
import 'package:get/get.dart';

import '../../base/authentication_middelware.dart';
import '../modules/details/details_binding.dart';
import '../modules/details/details_page.dart';

class DetailsRoutes {
  DetailsRoutes._();

  static final routes = [
    GetPage(
        name: '/details',
        page: DetailsPage.new,
        binding: DetailsBinding(),
        middlewares: [AuthMiddleWare()],
        transition: Transition.rightToLeft),
  ];
}
