import 'package:watch_app/core/app_export.dart';

class FavouritesModel {
  RxList<int> ?productIds = <int>[].obs;
  FavouritesModel({this.productIds});

  FavouritesModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      productIds!.value= <int>[];
      json['products'].forEach((v) {
        productIds!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.productIds != null) {
      data['products'] = this.productIds!.map((v) => v).toList();
    }
    return data;
  }
}