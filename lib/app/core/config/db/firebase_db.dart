import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yash_oil/app/model/order_detail_model.dart';

import '../../../../util/exports.dart';

export 'package:get/get.dart';

abstract class FireBaseDB {
  static final FirebaseAuth _firebaseAuthInstance = FirebaseAuth.instance;
  static final FirebaseFirestore _firebaseDataBaseInstance =
      FirebaseFirestore.instance;

  static void firebaseConfig() {
    _firebaseAuthInstance.authStateChanges().listen((User? user) {
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
      {required String email,
      required String password,
      Function? onLogin}) async {
    try {
      showLoader(value: true);
      var user = await _firebaseAuthInstance.signInWithEmailAndPassword(
          email: email, password: password);
      showLoader(value: false);
      onLogin?.call();
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

  static Future<void> addOrderDetails(OrderDetailModel orderDetailModel) async {
    showLoader(value: true);
    await _firebaseDataBaseInstance
        .collection(AppConstant.orderPath)
        .add(orderDetailModel.toJson());
    showLoader(value: false);
    showSnackBar(message: "Data Added Successfully");
  }

  static void logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
