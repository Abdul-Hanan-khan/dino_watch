
class PlaceOrderModel {
  String? status;
  int? transactionId;
  String? referenceId;
  String? paymentLink;

  PlaceOrderModel(
      {this.status, this.transactionId, this.referenceId, this.paymentLink});

  PlaceOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    transactionId = json['transaction_id'];
    referenceId = json['reference_id'];
    paymentLink = json['payment_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['transaction_id'] = this.transactionId;
    data['reference_id'] = this.referenceId;
    data['payment_link'] = this.paymentLink;
    return data;
  }
}




// import 'package:watch_app/model/product_by_cat_model.dart';
//
// class PlaceOrderModel {
//   String? userId;
//   String? shipingFirstName;
//   String? shipingLastName;
//   String? shipingEmail;
//   String? shipingPhone;
//   String? shipingAddress;
//   String? shipingCountry;
//   String? shipingState;
//   String? shipingPostCode;
//   List<Products>? itemsList;
//
//   PlaceOrderModel(
//       {this.userId,
//         this.shipingFirstName,
//         this.shipingLastName,
//         this.shipingEmail,
//         this.shipingPhone,
//         this.shipingAddress,
//         this.shipingCountry,
//         this.shipingState,
//         this.shipingPostCode,
//         this.itemsList});
//
//   PlaceOrderModel.fromJson(Map<String, dynamic> json) {
//     userId = json['user_id'];
//     shipingFirstName = json['shiping_first_name'];
//     shipingLastName = json['shiping_last_name'];
//     shipingEmail = json['shiping_email'];
//     shipingPhone = json['shiping_phone'];
//     shipingAddress = json['shiping_address'];
//     shipingCountry = json['shiping_country'];
//     shipingState = json['shiping_state'];
//     shipingPostCode = json['shiping_post_code'];
//     if (json['items_list'] != null) {
//       itemsList = <Products>[];
//       json['items_list'].forEach((v) {
//         itemsList!.add(new Products.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['user_id'] = this.userId;
//     data['shiping_first_name'] = this.shipingFirstName;
//     data['shiping_last_name'] = this.shipingLastName;
//     data['shiping_email'] = this.shipingEmail;
//     data['shiping_phone'] = this.shipingPhone;
//     data['shiping_address'] = this.shipingAddress;
//     data['shiping_country'] = this.shipingCountry;
//     data['shiping_state'] = this.shipingState;
//     data['shiping_post_code'] = this.shipingPostCode;
//     if (this.itemsList != null) {
//       data['items_list'] = this.itemsList!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class ItemsList {
//   String? productId;
//   String? productName;
//   int? productPrice;
//   int? productQty;
//
//   ItemsList(
//       {this.productId, this.productName, this.productPrice, this.productQty});
//
//   ItemsList.fromJson(Map<String, dynamic> json) {
//     productId = json['product_id'];
//     productName = json['product_name'];
//     productPrice = json['product_price'];
//     productQty = json['product_qty'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['product_id'] = this.productId;
//     data['product_name'] = this.productName;
//     data['product_price'] = this.productPrice;
//     data['product_qty'] = this.productQty;
//     return data;
//   }
// }
