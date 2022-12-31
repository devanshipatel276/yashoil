import 'package:yash_oil/app/enums/enums_utils.dart';

class LocalContainerDetailModel {
  ContainerType type;
  String quantity;
  String price;

  LocalContainerDetailModel(
      {required this.price, required this.type, required this.quantity});
}

class ContainerDetailModel {
  int? type;
  String? quantity;
  String? price;

  ContainerDetailModel(
      {required this.price, required this.type, required this.quantity});

  ContainerDetailModel.fromJson(Map<String, dynamic> json) {
    type = json["type"];
    quantity = json["quantity"];
    price = json["price"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["type"] = type;
    data["quantity"] = quantity;
    data["price"] = price;
    return data;
  }
}
