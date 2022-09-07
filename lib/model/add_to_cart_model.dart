import 'package:get/get.dart';
import 'package:watch_app/model/product_by_cat_model.dart';


// class Cart {
//   RxList<ProductByCat>? products = <ProductByCat>[].obs;
//   Cart({this.products});
//
//   Cart.fromJson(Map<String, dynamic> json) {
//     if (json['products'] != null) {
//       products= <ProductByCat>[].obs;
//       json['products'].forEach((v) {
//         products!.add( ProductByCat.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (products != null) {
//       data['products'] = products!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }


class AddToCart {
  String? status;
  int? products;

  AddToCart({this.status, this.products});

  AddToCart.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    products = json['products'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['products'] = this.products;
    return data;
  }
}
