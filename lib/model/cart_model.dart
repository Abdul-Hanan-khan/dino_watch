import 'package:get/get.dart';
import 'package:watch_app/model/watch_details_model.dart';

class Cart {
  RxList<WatchDetailsModel> ?products = <WatchDetailsModel>[].obs;
  Cart({this.products});

  Cart.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products= <WatchDetailsModel>[].obs;
      json['products'].forEach((v) {
        products!.add(WatchDetailsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}