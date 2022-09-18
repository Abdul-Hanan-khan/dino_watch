class AuthModel {
  String? status;
  int? userId;
  String? userName;
  String? userEmail;
  String? profileImage;

  AuthModel(
      {this.status,
        this.userId,
        this.userName,
        this.userEmail,
        this.profileImage});

  AuthModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_email'] = this.userEmail;
    data['profile_image'] = this.profileImage;
    return data;
  }
}
