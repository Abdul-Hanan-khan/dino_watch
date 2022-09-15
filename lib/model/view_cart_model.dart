class ViewCartModel {
  String? status;
  List<CartProducts>? products;

  ViewCartModel({this.status, this.products});

  ViewCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['products'] != null) {
      products = <CartProducts>[];
      json['products'].forEach((v) {
        products!.add(new CartProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartProducts {
  int? proudctId;
  String? productTitle;
  int? productQty;
  String? productPrice;
  String? productImg;

  CartProducts(
      {this.proudctId,
        this.productTitle,
        this.productQty,
        this.productPrice,
        this.productImg});

  CartProducts.fromJson(Map<String, dynamic> json) {
    proudctId = json['proudct_id'];
    productTitle = json['product_title'];
    productQty = json['product_qty'];
    productPrice = json['product_price'];
    productImg = json['product_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['proudct_id'] = this.proudctId;
    data['product_title'] = this.productTitle;
    data['product_qty'] = this.productQty;
    data['product_price'] = this.productPrice;
    data['product_img'] = this.productImg;
    return data;
  }
}
