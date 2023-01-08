import 'package:yash_oil/app/model/container_detail_model.dart';

class OrderDetailModel {
  String? customerName;
  String? key;
  String? customerAddress;
  String? customerMobileNumber;
  String? orderDate;
  String? paymentDate;
  String? billNumber;
  String? comments;
  String? paymentStatus;
  String? orderCompletedDate;
  List<ContainerDetailModel>? containerList;
  String? deliveryStatus;
  String? totalAmount;
  String? totalQuantity;
  String? userMail;

  OrderDetailModel(
      {required this.customerName,
      required this.customerAddress,
      required this.customerMobileNumber,
      required this.orderDate,
      required this.orderCompletedDate,
      required this.paymentStatus,
      required this.deliveryStatus,
      required this.containerList,
      required this.totalAmount,
      required this.totalQuantity,
      this.paymentDate,
      this.userMail,
      this.key,
      this.billNumber,
      this.comments});

  OrderDetailModel.fromJson(Map<String, dynamic> json) {
    customerName = json["customer_name"];
    key = json["key"];
    customerAddress = json["customer_address"];
    userMail = json["user_email"];
    customerMobileNumber = json["customer_mobile_number"];
    orderDate = json["order_date"];
    billNumber = json["bill_number"];
    comments = json["comments"];
    paymentStatus = json["payment_status"];
    deliveryStatus = json["delivery_status"];
    paymentDate = json["payment_date"];
    totalAmount = json["total_amount"];
    totalQuantity = json["total_quantity"];
    orderCompletedDate = json["order_complete_date"];
    if (json['container_list'] != null) {
      containerList = <ContainerDetailModel>[];
      json['container_list'].forEach((v) {
        containerList?.add(ContainerDetailModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (containerList != null) {
      data['container_list'] = containerList?.map((v) => v.toJson()).toList();
    }
    data["customer_name"] = customerName;
    data["user_email"] = userMail;
    data["key"] = key;
    data["customer_address"] = customerAddress;
    data["customer_mobile_number"] = customerMobileNumber;
    data["order_date"] = orderDate;
    data["payment_date"] = paymentDate;
    data["bill_number"] = billNumber;
    data["order_complete_date"] = orderCompletedDate;
    data["comments"] = comments;
    data["payment_status"] = paymentStatus;
    data["delivery_status"] = deliveryStatus;
    data["total_amount"] = totalAmount;
    data["total_quantity"] = totalQuantity;
    return data;
  }
}
