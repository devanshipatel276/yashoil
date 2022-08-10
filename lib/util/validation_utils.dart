

import 'exports.dart';

bool isEmailValidate(String email) {
  return GetUtils.isEmail(email);
}

bool isEmptyField(String? fieldText) {
  return GetUtils.isNullOrBlank(fieldText) ?? false;
}

bool isPasswordValidate(String password) {
  return password.contains(RegExpressions.password) ? true : false;
}

bool isContactNumberValidate(String password) {
  return password.contains(RegExpressions.phoneNumber) ? true : false;
}

String? validateEmail(String str) {
  if (str.isEmpty) {
    return "Please Enter Email Id";
  } else if (!GetUtils.isEmail(str)) {
    return "Invalid Email id";
  } else {
    return null;
  }
}

String? validatePassword(String str) {
  if (str.isEmpty) {
    return "Please enter password";
  } else if (!RegExpressions.password.hasMatch(str)) {
    return "Invalid password format";
  } else {
    return null;
  }
}
