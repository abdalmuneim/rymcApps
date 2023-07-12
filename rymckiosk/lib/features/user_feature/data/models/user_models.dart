class UserModel {
  int? id;
  String? name;
  String? phone;
  String? deviceId;

  UserModel({this.id, this.name, this.phone, this.deviceId});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    deviceId = json['deviceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['deviceId'] = deviceId;
    return data;
  }
}
