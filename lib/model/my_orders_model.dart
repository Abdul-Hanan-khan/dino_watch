class MyOrdersModel {
  String? status;
  List<Orderlist>? orderlist;

  MyOrdersModel({this.status, this.orderlist});

  MyOrdersModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['orderlist'] != null) {
      orderlist = <Orderlist>[];
      json['orderlist'].forEach((v) {
        orderlist!.add(new Orderlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.orderlist != null) {
      data['orderlist'] = this.orderlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orderlist {
  int? orderId;
  String? orderDate;
  String? orderStatus;
  String? orderAmount;

  Orderlist({this.orderId, this.orderDate, this.orderStatus, this.orderAmount});

  Orderlist.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderDate = json['order_date'];
    orderStatus = json['order_status'];
    orderAmount = json['order_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_date'] = this.orderDate;
    data['order_status'] = this.orderStatus;
    data['order_amount'] = this.orderAmount;
    return data;
  }
}
