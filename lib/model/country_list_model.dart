class CountryListModel {
  String? code;
  String? name;

  CountryListModel({this.code, this.name,});

  CountryListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;

    return data;
  }
}
