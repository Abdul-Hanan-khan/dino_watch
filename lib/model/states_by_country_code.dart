class StatesByCountryCodeModel {
  String? code;
  String? name;
  List<States>? states;
  // Links? lLinks;

  StatesByCountryCodeModel({this.code, this.name, this.states,});

  StatesByCountryCodeModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    if (json['states'] != null) {
      states = <States>[];
      json['states'].forEach((v) {
        states!.add(new States.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    if (this.states != null) {
      data['states'] = this.states!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class States {
  String? code;
  String? name;

  States({this.code, this.name});

  States.fromJson(Map<String, dynamic> json) {
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

// class Links {
//   List<Self>? self;
//   List<Collection>? collection;
//
//   Links({this.self, this.collection});
//
//   Links.fromJson(Map<String, dynamic> json) {
//     if (json['self'] != null) {
//       self = <Self>[];
//       json['self'].forEach((v) {
//         self!.add(new Self.fromJson(v));
//       });
//     }
//     if (json['collection'] != null) {
//       collection = <Collection>[];
//       json['collection'].forEach((v) {
//         collection!.add(new Collection.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.self != null) {
//       data['self'] = this.self!.map((v) => v.toJson()).toList();
//     }
//     if (this.collection != null) {
//       data['collection'] = this.collection!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Self {
//   String? href;
//
//   Self({this.href});
//
//   Self.fromJson(Map<String, dynamic> json) {
//     href = json['href'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['href'] = this.href;
//     return data;
//   }
// }
