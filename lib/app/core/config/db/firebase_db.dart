import 'package:firebase_auth/firebase_auth.dart';
import 'package:yash_oil/app/core/config/shared_preference.dart';

import '../../../../util/exports.dart';

export 'package:get/get.dart';

abstract class FireBaseDB {
  static FirebaseAuth firebaseInstance = FirebaseAuth.instance;

  static void firebaseConfig() {
    firebaseInstance.authStateChanges().listen((User? user) {
      if (user == null) {
        SharedPref.setValue(PrefsKey.isLoggedIn, false);
        print('User is currently signed out!');
      } else {
        SharedPref.setValue(PrefsKey.isLoggedIn, true);
        print('User is signed in!');
      }
    });
  }

  static void firebaseLogin(
      {required String email, required String password}) async {
    try {
      showLoader(value: true);
      var user = await firebaseInstance.signInWithEmailAndPassword(
          email: email, password: password);
      print("Success--------->");
    } on FirebaseAuthException catch (e) {
      showLoader(value: false);
      print(e.code);
      if (e.code == 'user-not-found') {
        showSnackBar(message: AppString.userNotFoundKey.tr);
      } else if (e.code == 'wrong-password') {
        showSnackBar(message: AppString.passwordNotCorrectKey.tr);
      } else {
        showSnackBar(message: e.message ?? "");
      }
    }
  }

  static void logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
