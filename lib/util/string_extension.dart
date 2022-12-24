import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:yash_oil/app/core/config/app_string.dart';

import '../util/reg_expressions.dart';

extension Util on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNotNullOrEmpty => !isNullOrEmpty;

  bool get isBlank => this == null || this!.trim().isEmpty;

  bool get isNotBlank => !isBlank;

  bool get isNullOrBlank => this == null || isBlank;

  bool get isNotNullOrBlank => !isNullOrBlank;

  bool get isValidEmail => RegExpressions.email.hasMatch(this ?? '');

  bool get isValidPhoneNumber =>
      RegExpressions.phoneNumber.hasMatch(this ?? '');

  bool get isValidPassword => RegExpressions.password.hasMatch(this ?? '');

  String get toTitleCase =>
      this == null ? '' : '${this![0].toUpperCase()}${this!.substring(1)}';

  String get toBase64 => base64.encode(utf8.encode(this ?? ''));
}

extension ListUtil on List<String> {
  String get joinToString => reduce((curr, next) => '$curr,$next');
}

extension TextFieldValidator on String {
  String? validateEmail() {
    if (isEmpty) {
      return AppString.pleaseEnterEmailIdKey.tr;
    } else if (!GetUtils.isEmail(this)) {
      return AppString.invalidEmailIdKey.tr;
    } else {
      return null;
    }
  }

  String? validatePassword() {
    if (isEmpty) {
      return AppString.pleaseEnterPasswordKey.tr;
    } else if (!RegExpressions.password.hasMatch(this)) {
      return AppString.passwordShouldHaveKey.tr;
    } else {
      return null;
    }
  }
}
