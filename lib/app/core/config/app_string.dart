import '../../../util/exports.dart';

/// define all the Strings here which we have to localize

class AppString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        englishKey: {appName: 'GetXBase', login: 'Login', yashOil: 'Yash Oil'},
      };

  /// define all the keys here and use it in above may as key and give value of that key

  static const String englishKey = 'en_US';

  static const String appName = "appNameKey";
  static const String login = "loginKey";
  static const String yashOil = "yashOilKey";
}
