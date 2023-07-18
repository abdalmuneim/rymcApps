import 'dart:convert';

import 'package:rymc/features/notification/domain/entities/notification_entities.dart';

class NotificationModel extends Notification {
  NotificationModel({
    super.id,
    super.title,
    super.description,
    super.image,
    super.data,
    super.getAt,
  });

  factory NotificationModel.fromMap(Map<String, dynamic> json) =>
      NotificationModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        image: json['image'],
        data: json['data'],
        getAt: json['getAt'],
      );

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = new Map<String, dynamic>();
    map['id'] = this.id;
    map['title'] = this.title;
    map['description'] = this.description;
    map['image'] = this.image;
    map['data'] = this.data;
    map['getAt'] = this.getAt;
    return map;
  }

  String toJson() => json.encode(toMap());
  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
