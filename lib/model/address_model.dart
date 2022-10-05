import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
  RxString? firstName =''.obs;
 RxString? lastName=''.obs;
 RxString? email=''.obs;
 RxString? phoneNumber=''.obs;
 RxString? address=''.obs;
 RxString? postalCode=''.obs;
 RxString? country=''.obs;
 RxString? state=''.obs;
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
    firstName!.value = json['first_name'];
    lastName!.value = json['last_name'];
    email!.value = json['email'];
    phoneNumber!.value = json['phone_number'];
    address!.value = json['address'];
    postalCode!.value = json['postal_code'];
    country!.value = json['country'];
    state!.value = json['state'];
    isSelected!.value=json['is_selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName!.value;
    data['last_name'] = this.lastName!.value;
    data['email'] = this.email!.value;
    data['phone_number'] = this.phoneNumber!.value;
    data['address'] = this.address!.value;
    data['postal_code'] = this.postalCode!.value;
    data['country'] = this.country!.value;
    data['state'] = this.state!.value;
    data['is_selected'] = this.isSelected!.value;
    return data;
  }
}
