
import '../../../base/base_view.dart';
import '../../../util/exports.dart';
import '../../core/config/shared_preference.dart';
import 'login_controller.dart';

class LoginPage extends BaseGetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget buildView() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'LoginPage is working',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () {
                  showLoader(value: true);
                  Future.delayed(
                    const Duration(seconds: 3),
                        () {
                      showLoader(value: false);
                      showSnackbar(value: "Login Successful...!!");
                      SharedPref.setValue(PrefsKey.isLoggedIn, true);
                      controller.offAllNamed(AppPages.INITIAL);
                    },
                  );
                },
                child: Padding(padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                child: Text(AppString.login.tr)))
          ],
        ),
      ),
    );
  }

  @override
  String? getTag() {
    return (LoginController).toString();
  }
}
