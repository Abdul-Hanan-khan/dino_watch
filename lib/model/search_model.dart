import 'package:get/get.dart';

class SearchModel {
  String? status;
  RxList<Products>? products = <Products>[].obs
  ;

  SearchModel({this.status, this.products});

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['products'] != null) {
      products!.value = <Products>[];
      json['products'].forEach((v) {
        products!.value.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.products!.value != null) {
      data['products'] = this.products!.value!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? productId;
  String? title;
  String? description;
  String? shortDescription;
  String? price;
  String? regularPrice;
  String? salePrice;
  String? productImg;

  Products(
      {this.productId,
        this.title,
        this.description,
        this.shortDescription,
        this.price,
        this.regularPrice,
        this.salePrice,
        this.productImg});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    title = json['title'];
    description = json['description'];
    shortDescription = json['short_description'];
    price = json['price'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    productImg = json['product_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['short_description'] = this.shortDescription;
    data['price'] = this.price;
    data['regular_price'] = this.regularPrice;
    data['sale_price'] = this.salePrice;
    data['product_img'] = this.productImg;
    return data;
  }
}
