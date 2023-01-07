import 'package:yash_oil/app/ui/orderdetail/order_detail_page.dart';

import '../../../util/exports.dart';
import '../ui/orderdetail/order_detail_binding.dart';
import 'authentication_middelware.dart';

class AppPages {
  AppPages._();

  static const splash = '/splash';
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const menu = '/menu';
  static const addOrder = '/add_order';
  static const editOrder = '/edit_order';
  static const orderDetail = '/order_detail';

  static final routes = [
    ...SplashPageRoutes.routes,
    ...LoginPageRoutes.routes,
    ...DashBoardPageRoutes.routes,
    ...MenuPageRoutes.routes,
    ...AddOrderPageRoutes.routes,
    ...EditOrderPageRoutes.routes,
    ...OrderDetailPageRoutes.routes,
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

class LoginPageRoutes {
  LoginPageRoutes._();

  static final routes = [
    basePage(
      name: AppPages.login,
      page: LoginPage.new,
      binding: LoginBinding(),
      middlewares: [AuthMiddleWare()],
    ),
  ];
}

class DashBoardPageRoutes {
  DashBoardPageRoutes._();

  static final routes = [
    basePage(
      name: AppPages.dashboard,
      page: DashBoardPage.new,
      binding: DashBoardBinding(),
    ),
  ];
}

class MenuPageRoutes {
  MenuPageRoutes._();

  static final routes = [
    basePage(
      name: AppPages.menu,
      page: MenuPage.new,
      binding: MenuBinding(),
    ),
  ];
}

class AddOrderPageRoutes {
  AddOrderPageRoutes._();

  static final routes = [
    basePage(
      name: AppPages.addOrder,
      page: AddOrderPage.new,
      binding: AddOrderBinding(),
    ),
  ];
}

class EditOrderPageRoutes {
  EditOrderPageRoutes._();

  static final routes = [
    basePage(
      name: AppPages.editOrder,
      page: EditOrderPage.new,
      binding: EditOrderBinding(),
    ),
  ];
}

class OrderDetailPageRoutes {
  OrderDetailPageRoutes._();

  static final routes = [
    basePage(
      name: AppPages.orderDetail,
      page: OrderDetailPage.new,
      binding: OrderDetailBinding(),
    ),
  ];
}
