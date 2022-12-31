import 'package:yash_oil/app/enums/enums_utils.dart';

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

String getContainerName(ContainerType type) {
  switch (type) {
    case ContainerType.fifteenLtrTin:
      return AppString.fifteenLtrTinKey.tr;
    case ContainerType.fiveLtr:
      return AppString.fiveLtrKey.tr;
    case ContainerType.fifteenKgPlastic:
      return AppString.fifteenKgPlasticKey.tr;
    case ContainerType.fifteenKgTin:
      return AppString.fifteenKgTinKey.tr;
    case ContainerType.fifteenLtrPlastic:
      return AppString.fifteenLtrPlasticKey.tr;
  }
}

int getContainerIndex(ContainerType type) {
  switch (type) {
    case ContainerType.fifteenLtrTin:
      return ContainerType.fifteenLtrTin.type;
    case ContainerType.fiveLtr:
      return ContainerType.fiveLtr.type;
    case ContainerType.fifteenKgPlastic:
      return ContainerType.fifteenKgPlastic.type;
    case ContainerType.fifteenKgTin:
      return ContainerType.fifteenKgTin.type;
    case ContainerType.fifteenLtrPlastic:
      return ContainerType.fifteenLtrPlastic.type;
  }
}
