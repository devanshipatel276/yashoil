import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yash_oil/app/core/config/shared_preference.dart';
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

  static Future<void> addOrderDetails(
      OrderDetailModel orderDetailModel, Function() onSave) async {
    showLoader(value: true);
    await _firebaseDataBaseInstance
        .collection(AppConstant.orderPath)
        .add(orderDetailModel.toJson())
        .then((value) async {
      orderDetailModel.key = value.id;
      await updateOrderDetails(orderDetailModel, () {
        onSave.call();
      });
    });
  }

  static Future<void> updateOrderDetails(
      OrderDetailModel orderDetailModel, Function() onSave) async {
    showLoader(value: true);
    await _firebaseDataBaseInstance
        .collection(AppConstant.orderPath)
        .doc(orderDetailModel.key)
        .update(orderDetailModel.toJson())
        .then((value) {
      showLoader(value: false);
      onSave.call();
    });
  }

  static Future<OrderDetailModel?> getOrderDetails(String path) async {
    showLoader(value: true);
    return await _firebaseDataBaseInstance
        .collection(AppConstant.orderPath)
        .doc(path)
        .get()
        .then((event) {
      showLoader(value: false);
      if (event.data() != null) {
        return OrderDetailModel.fromJson(event.data()!);
      }
    });
  }

  static void logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
