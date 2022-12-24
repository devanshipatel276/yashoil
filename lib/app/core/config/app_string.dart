import '../../../util/exports.dart';

/// define all the Strings here which we have to localize

class AppString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        englishKey: {
          appName: 'GetXBase',
          login: 'Login',
          yashOil: 'Yash Oil',
          tag: 'From earth to your home',
          logInKey: "Log In",
          emailAddressKey: "Email Address",
          loginDescriptionKey:
              "Access yash oil business by logging in to your account",
          pleaseEnterEmailIdKey: "Please enter email id",
          invalidEmailIdKey: "Please enter valid email id",
          pleaseEnterPasswordKey: "Please enter password",
          passwordShouldHaveKey:
              "password should have one special one upper character one lower character and 7 minimum characters",
          passwordKey: "Password",
          userNotFoundKey: "User doesn't found!",
          passwordNotCorrectKey: "Please enter correct password",
          logOutKey: "Log Out",
          addNewOrderKey: "Add New Order",
          logoutDescriptionKey: "Are you sure you want to logout?",
          cancelBtnKey: "Cancel",
        },
      };

  /// define all the keys here and use it in above may as key and give value of that key

  static const String englishKey = 'en_US';

  static const String appName = "appNameKey";
  static const String login = "loginKey";
  static const String yashOil = "yashOilKey";
  static const String tag = "tagKey";
  static const String logInKey = "logInKey";
  static const String logOutKey = "logOutKey";
  static const String logoutDescriptionKey = "logoutDescriptionKey";
  static const String loginDescriptionKey = "loginDescriptionKey";
  static const String emailAddressKey = "emailAddressKey";
  static const String pleaseEnterEmailIdKey = "pleaseEnterEmailIdKey";
  static const String invalidEmailIdKey = "invalidEmailIdKey";
  static const String pleaseEnterPasswordKey = "pleaseEnterPasswordKey";
  static const String passwordShouldHaveKey = "passwordShouldHaveKey";
  static const String passwordKey = "passwordKey";
  static const String userNotFoundKey = "userNotFoundKey";
  static const String passwordNotCorrectKey = "passwordNotCorrectKey";
  static const String addNewOrderKey = "addNewOrderKey";
  static const String cancelBtnKey = "cancelBtnKey";
}
