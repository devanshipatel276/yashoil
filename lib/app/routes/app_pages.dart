
import 'details_routes.dart';
import 'home_routes.dart';
import 'login_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = '/home';
  static const login = '/login';
  static const details = '/details';

  static final routes = [
    ...HomeRoutes.routes,
    ...LoginRoutes.routes,
    ...DetailsRoutes.routes
  ];
}
