import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:rymckiosk/features/doctors_feature/data/models/doctors_model.dart';
import 'package:rymckiosk/features/home_feature/data/models/enums.dart';

class FireStoreFCMToken {
  static FireStoreFCMToken _init = FireStoreFCMToken();

  static FireStoreFCMToken instance = _init;

  final CollectionReference _fcmTokenCollectionReference =
      FirebaseFirestore.instance.collection('FCM Tokens');
  final CollectionReference _fcmTokenCollectionReferenceTest =
      FirebaseFirestore.instance.collection('Test FCM Tokens');

  Future<DocumentReference<Map<String, dynamic>>> addFCMTokenToFireStore(
      UserType userType, DoctorModel addDocModel) async {
    if (kDebugMode) {
      if (addDocModel.phone != null) {
        return await _fcmTokenCollectionReferenceTest
            .doc(userType.name)
            .collection(addDocModel.phone.toString())
            .add(
              addDocModel.toJson(),
            );
      } else {
        return await _fcmTokenCollectionReferenceTest
            .doc(userType.name)
            .collection(DateTime.now().microsecondsSinceEpoch.toString())
            .add(
          {
            "FCMToken": addDocModel.fcmToken,
            "deviceId": addDocModel.deviceId,
            "createdAt": DateTime.now().toString(),
          },
        );
      }
    } else {
      if (addDocModel.phone != null) {
        return await _fcmTokenCollectionReference
            .doc(userType.name)
            .collection(addDocModel.phone.toString())
            .add(
          {
            "phone": addDocModel.phone,
            "FCMToken": addDocModel.fcmToken,
            "deviceId": addDocModel.deviceId,
            "createdAt": DateTime.now().toString(),
          },
        );
      } else {
        return await _fcmTokenCollectionReference
            .doc(userType.name)
            .collection(DateTime.now().microsecondsSinceEpoch.toString())
            .add(
          {
            "FCMToken": addDocModel.fcmToken,
            "deviceId": addDocModel.deviceId,
            "createdAt": DateTime.now().toString(),
          },
        );
      }
    }
  }

  Future<String?> getFCMToken(String phone) async {
    if (kDebugMode) {
      final Stream<QuerySnapshot<Map<String, dynamic>>> data =
          await _fcmTokenCollectionReferenceTest
              .doc(UserType.Doctors.name)
              .collection(phone)
              .snapshots();
      String? fcm;
      await for (var element in data) {
        for (var e in element.docs) {
          fcm = e["FCMToken"];
        }
        print("fcm: $fcm");
        return fcm;
      }
      return fcm;
    } else {
      final Stream<QuerySnapshot<Map<String, dynamic>>> data =
          await _fcmTokenCollectionReference
              .doc(UserType.Doctors.name)
              .collection(phone)
              .snapshots();
      String? fcm;
      await for (var element in data) {
        for (var e in element.docs) {
          fcm = e["fcmToken"];
        }
        return fcm;
      }
      return fcm;
    }
  }
}
