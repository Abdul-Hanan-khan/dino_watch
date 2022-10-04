class AllColors {
  String? status;
  List<Brandlist>? brandlist;

  AllColors({this.status, this.brandlist});

  AllColors.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['brandlist'] != null) {
      brandlist = <Brandlist>[];
      json['brandlist'].forEach((v) {
        brandlist!.add(new Brandlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.brandlist != null) {
      data['brandlist'] = this.brandlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Brandlist {
  int? termId;
  String? name;
  String? slug;
  int? productCount;

  Brandlist({this.termId, this.name, this.slug, this.productCount});

  Brandlist.fromJson(Map<String, dynamic> json) {
    termId = json['term_id'];
    name = json['name'];
    slug = json['slug'];
    productCount = json['product_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['term_id'] = this.termId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['product_count'] = this.productCount;
    return data;
  }
}
