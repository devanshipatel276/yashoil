import 'package:yash_oil/app/enums/enums_utils.dart';

import 'exports.dart';

void hideKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

void goBack({dynamic result}) {
  hideKeyboard();

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

ContainerType? getContainerType(int index) {
  if (index == ContainerType.fifteenLtrTin.type) {
    return ContainerType.fifteenLtrTin;
  } else if (index == ContainerType.fifteenLtrPlastic.type) {
    return ContainerType.fifteenLtrPlastic;
  } else if (index == ContainerType.fiveLtr.type) {
    return ContainerType.fiveLtr;
  } else if (index == ContainerType.fifteenKgTin.type) {
    return ContainerType.fifteenKgTin;
  } else if (index == ContainerType.fifteenKgPlastic.type) {
    return ContainerType.fifteenKgPlastic;
  } else {
    return null;
  }
}

String getOrderString(OrderStatus status) {
  if (status == OrderStatus.pending) {
    return AppString.pendingKey.tr;
  } else if (status == OrderStatus.delivered) {
    return AppString.deliveredKey.tr;
  } else {
    return "";
  }
}

OrderStatus? getOrderStatus(String? status) {
  if (status == AppString.pendingKey.tr) {
    return OrderStatus.pending;
  } else if (status == AppString.deliveredKey.tr) {
    return OrderStatus.delivered;
  } else {
    return null;
  }
}

PaymentStatus? getPaymentStatus(String? status) {
  if (status == AppString.onlineKey.tr) {
    return PaymentStatus.online;
  } else if (status == AppString.cashKey.tr) {
    return PaymentStatus.cash;
  } else if (status == AppString.unPaidKey.tr) {
    return PaymentStatus.unPaid;
  } else {
    return null;
  }
}
