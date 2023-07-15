import 'dart:convert';

import 'package:rymc/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    super.name,
    super.nationalId,
    super.phone,
    super.fcm,
    super.createAt,
    super.member,
    this.uid,
  });
  final String? uid;

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        name: json['name'],
        phone: json['phone'],
        nationalId: json['nationalId'],
        createAt: json['createAt'],
        fcm: json['fcm'],
        uid: json['uid'],
        member: json["member"] == null
            ? []
            : List<UserModel>.from(
                json["member"]!.map(
                  (x) => UserModel.fromMap(x),
                ),
              ),
      );

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['name'] = name;
    data['phone'] = phone;
    data['nationalId'] = nationalId;
    data['createAt'] = createAt;
    data['fcm'] = fcm;
    data['uid'] = uid;
    return data;
  }

  String toJson() => json.encode(toMap());
  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
