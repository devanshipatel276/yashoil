import '../../util/exports.dart';
import '../core/config/shared_preference.dart';

class AuthMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    var isLoggedIn = SharedPref.getBool(PrefsKey.isLoggedIn, false);
    if (isLoggedIn) {
      return const RouteSettings(name: AppPages.dashboard);
    } else {
      return null;
    }
  }
}
