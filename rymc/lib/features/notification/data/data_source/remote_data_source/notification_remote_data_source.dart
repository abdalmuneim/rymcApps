import 'dart:io';

import 'package:rymc/common/handler/exception.dart';
import 'package:rymc/common/services/server_service.dart';
import 'package:rymc/features/notification/data/data_source/firebase_collections/notification_collection.dart';
import 'package:rymc/features/notification/data/model/notification_model.dart';

abstract class INotificationRemoteDataSource {
  Future<void> addNotification({
    required int id,
    required String title,
    required String description,
    String? image,
    // required Map<dynamic, dynamic> data,
    required String getAt,
    required String uid,
  });
  Future<List<NotificationModel>> getNotifications({required String uid});
}

class NotificationRemoteDataSource implements INotificationRemoteDataSource {
  @override
  Future<void> addNotification(
      {required int id,
      required String title,
      required String description,
      String? image,
      // required Map<dynamic, dynamic> data,
      required String uid,
      required String getAt}) async {
    try {
      NotificationModel user = NotificationModel(
          id: id,
          title: title,
          description: description,
          image: image,
          // data: data,
          getAt: getAt);
      return await NotificationCollection.instance
          .addNotification(uid: uid, notification: user);
    } on SocketException {
      ServerService<void>().timeOutMethod(
        () => addNotification(
          id: id,
          title: title,
          description: description,
          image: image,
          // data: data,
          getAt: getAt,
          uid: uid,
        ),
      );
    } catch (e) {
      print(e);
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<List<NotificationModel>> getNotifications(
      {required String uid}) async {
    try {
      return await NotificationCollection().getNotification(uid: uid);
    } on SocketException {
      return ServerService<List<NotificationModel>>().timeOutMethod(
        () => getNotifications(uid: uid),
      );
    } catch (e) {
      print(e);
      throw ServerException(
        message: e.toString(),
      );
    }
  }
}
