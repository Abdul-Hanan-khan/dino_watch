class GetCommentModel {
  bool? status;
  String? msg;
  List<Data>? data;

  GetCommentModel({this.status, this.msg, this.data});

  GetCommentModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? senderName;
  String? review;
  String? rating;
  String? userProfile;
  String? timeStamp;

  Data(
      {this.senderName,
        this.review,
        this.rating,
        this.userProfile,
        this.timeStamp});

  Data.fromJson(Map<String, dynamic> json) {
    senderName = json['sender_name'];
    review = json['review'];
    rating = json['rating'];
    userProfile = json['user_profile'];
    timeStamp = json['time_stamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sender_name'] = this.senderName;
    data['review'] = this.review;
    data['rating'] = this.rating;
    data['user_profile'] = this.userProfile;
    data['time_stamp'] = this.timeStamp;
    return data;
  }
}
