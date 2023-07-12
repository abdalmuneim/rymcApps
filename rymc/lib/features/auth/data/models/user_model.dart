class UserModel {
  int? id;
  String? name;
  String? phone;
  String? nationalId;

  UserModel({this.id, this.name, this.nationalId, this.phone});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    nationalId = json['nationalId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['nationalId'] = nationalId;
    return data;
  }
}
