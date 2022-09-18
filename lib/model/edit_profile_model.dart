class EditProfileModel {
  String? status;
  String? firstName;
  String? lastName;
  String? profileImage;

  EditProfileModel(
      {this.status, this.firstName, this.lastName, this.profileImage});

  EditProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['profile_image'] = this.profileImage;
    return data;
  }
}