class AdminModel {
  int? id;
  String? deviceId;
  String? phone;
  String? password;

  AdminModel(
      {this.id,
      required this.deviceId,
      required this.password,
      required this.phone});

  AdminModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.phone = json['phone'];
    this.password = json['password'];
    this.deviceId = json['deviceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['deviceId'] = this.deviceId;
    return data;
  }
}
