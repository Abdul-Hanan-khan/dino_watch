class AuthModel {
  int? userId;
  String? userName;
  String? userEmail;
  String? status;

  AuthModel({this.userId, this.userName, this.userEmail, this.status});

  AuthModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['user_email'] = this.userEmail;
    data['status'] = this.status;
    return data;
  }
}