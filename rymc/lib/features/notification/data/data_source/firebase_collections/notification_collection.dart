import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rymc/common/utils/fields.dart';
import 'package:rymc/features/notification/data/model/notification_model.dart';

class NotificationCollection {
  static NotificationCollection _init = NotificationCollection();
  static NotificationCollection instance = _init;

  final CollectionReference _notificationCollectionReference =
      FirebaseFirestore.instance.collection(Collections.users);

  Future<void> addNotification(
          {required NotificationModel notification,
          required String uid}) async =>
      await _notificationCollectionReference
          .doc(uid)
          .collection(Collections.notifications)
          .doc(notification.getAt)
          .set(notification.toMap());

  Future<List<NotificationModel>> getNotification({required String uid}) async {
    final data = await _notificationCollectionReference
        .doc(uid)
        .collection(Collections.notifications)
        .snapshots();
    List<NotificationModel> notifications = [];
    await for (var e in data) {
      for (var data in e.docs) {
        notifications.add(NotificationModel.fromMap(data.data()));
      }
      return notifications;
    }
    return notifications;
  }
}
