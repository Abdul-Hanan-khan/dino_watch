import 'package:get/get.dart';

class AddressModel {
  RxList<Addresses>? addressList = <Addresses>[].obs;

  AddressModel({this.addressList});

  AddressModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      addressList = <Addresses>[].obs;
      json['products'].forEach((v) {
        addressList!.add(Addresses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.addressList != null) {
      data['products'] = this.addressList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addresses {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? address;
  String? postalCode;
  String? country;
  String? state;
  RxBool? isSelected = false.obs;

  Addresses(
      {this.id,
        this.firstName,
      this.lastName,
      this.email,
      this.phoneNumber,
      this.address,
      this.postalCode,
      this.country,
      this.state,
      this.isSelected});

  Addresses.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    postalCode = json['postal_code'];
    country = json['country'];
    state = json['state'];
    isSelected!.value=json['is_selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['postal_code'] = this.postalCode;
    data['country'] = this.country;
    data['state'] = this.state;
    data['is_selected'] = this.isSelected!.value;
    return data;
  }
}
