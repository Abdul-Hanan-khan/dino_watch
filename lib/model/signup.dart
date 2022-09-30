import 'package:get/get.dart';

class AuthModel {
  String? status;
  int? userId;
  RxString? userName;
  RxString? firstName;
  RxString? lastName;
  RxString? userEmail;
  RxString? profileImage;

  AuthModel(
      {this.status,
        this.userId,
        this.userName,
        this.firstName,
        this.lastName,
        this.userEmail,
        this.profileImage});

  AuthModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userId = json['user_id'];
    userName!.value = json['user_name'];
    firstName!.value = json['first_name'];
    lastName!.value = json['last_name'];
    userEmail!.value = json['user_email'];
    profileImage!.value = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName!.value;
    data['first_name'] = this.firstName!.value;
    data['last_name'] = this.lastName!.value;
    data['user_email'] = this.userEmail!.value;
    data['profile_image'] = this.profileImage!.value;
    return data;
  }
}
