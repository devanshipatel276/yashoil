import 'exports.dart';

void hideKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

void goBack({dynamic result}) {
  if (Get.isSnackbarOpen) {
    Get.closeAllSnackbars();
  } else {
    Get.back(result: result);
  }
}
