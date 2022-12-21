import 'package:yash_oil/app/routes/base_routes.dart';
import 'package:yash_oil/app/ui/splash/splash_page.dart';

import '../ui/splash/splash_binding.dart';

class AppPages {
  AppPages._();

  static const splash = '/splash';
  static const login = '/login';
  static const details = '/details';

  static final routes = [
    ...SplashPageRoutes.routes,
  ];
}

class SplashPageRoutes {
  SplashPageRoutes._();

  static final routes = [
    basePage(
      name: AppPages.splash,
      page: SplashPage.new,
      binding: SplashBinding(),
    ),
  ];
}
