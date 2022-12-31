import 'package:yash_oil/app/enums/enums_utils.dart';

class LocalContainerDetailModel {
  ContainerType type;
  String quantity;
  String price;

  LocalContainerDetailModel(
      {required this.price, required this.type, required this.quantity});
}

class ContainerDetailModel {
  int type;
  String quantity;
  String price;

  ContainerDetailModel(
      {required this.price, required this.type, required this.quantity});
}
