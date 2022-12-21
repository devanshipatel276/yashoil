import '../app/core/config/shared_preference.dart';
import '../util/exports.dart';

class AuthMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    var isLoggedIn = SharedPref.getBool(PrefsKey.isLoggedIn, false);
    // if (route == AppPages.login) {
    //   if (isLoggedIn) {
    //     return const RouteSettings(name: AppPages.splash);
    //   }
    // } else {
    //   if (!isLoggedIn) {
    //     return const RouteSettings(name: AppPages.login);
    //   }
    // }

    return null;
  }
}
