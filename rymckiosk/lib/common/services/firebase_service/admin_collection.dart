import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:rymckiosk/features/home_feature/data/models/admin_model.dart';

class FireStoreAdmin {
  final CollectionReference _adminCollectionReference =
      FirebaseFirestore.instance.collection('Admins');

  final CollectionReference _adminCollectionReferenceTest =
      FirebaseFirestore.instance.collection('Test Admins');

  addAdminToFireStore({required AdminModel admin}) async {
    if (kDebugMode) {
      await _adminCollectionReferenceTest
          .doc(DateTime.now().toString())
          .set(admin.toJson());
    } else {
      await _adminCollectionReference
          .doc(DateTime.now().toString())
          .set(admin.toJson());
    }
  }

  Future<List<AdminModel>> getAdminFromFireStore() async {
    if (kDebugMode) {
      final Stream<QuerySnapshot<Object?>> data =
          _adminCollectionReferenceTest.limit(20).snapshots();
      List<AdminModel> admin = [];
      await for (var x in data) {
        for (var element in x.docs) {
          admin.add(AdminModel(
              phone: element["phone"],
              password: element["password"],
              deviceId: element["deviceId"]));
        }
        return admin;
      }
      return admin;
    } else {
      final Stream<QuerySnapshot<Object?>> data =
          _adminCollectionReference.limit(20).snapshots();
      List<AdminModel> admin = [];
      await for (var x in data) {
        for (var element in x.docs) {
          admin.add(
            AdminModel(
              phone: element["phone"],
              password: element["password"],
              deviceId: element["deviceId"],
            ),
          );
        }
        return admin;
      }
      return admin;
    }
  }
}
