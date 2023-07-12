import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:rymckiosk/features/doctors_feature/data/models/doctors_model.dart';

class FireStoreCollectionDoctors {
  static FireStoreCollectionDoctors _init = FireStoreCollectionDoctors();
  static FireStoreCollectionDoctors instance = _init;

  final CollectionReference _doctorCollectionReference =
      FirebaseFirestore.instance.collection('Doctors');
  final CollectionReference _doctorCollectionReferenceTest =
      FirebaseFirestore.instance.collection('Test Doctors');

  Future<void> addDoctorToFireStore(DoctorModel addDocModel) async {
    if (kDebugMode) {
      await _doctorCollectionReferenceTest
          .doc(addDocModel.phone)
          .set(addDocModel.toJson());
    } else {
      await _doctorCollectionReference
          .doc(addDocModel.phone)
          .set(addDocModel.toJson());
    }
  }

  Future<void> updateDoctor(DoctorModel doctor) async {
    if (kDebugMode) {
      await _doctorCollectionReferenceTest
          .doc(doctor.phone)
          .update(doctor.toJson());
    } else {
      await _doctorCollectionReference
          .doc(doctor.phone)
          .update(doctor.toJson());
    }
  }

  Future<List<DoctorModel>> getDoctors() async {
    if (kDebugMode) {
      final Stream<QuerySnapshot<Object?>> data =
          await _doctorCollectionReferenceTest.snapshots();
      List<DoctorModel> doctors = [];
      await for (var element in data) {
        for (var e in element.docs) {
          doctors.add(
            DoctorModel(
              name: e["name"],
              specialty: e["specialty"],
              phone: e["phone"],
              img: e["image"],
              aboutDoctor: e["aboutDoctor"],
            ),
          );
        }

        return doctors;
      }
      return doctors;
    } else {
      final data = await _doctorCollectionReference.snapshots();
      List<DoctorModel> doctors = [];
      await for (var element in data) {
        for (var e in element.docs) {
          doctors.add(
            DoctorModel(
              name: e["name"],
              specialty: e["specialty"],
              phone: e["phone"],
              img: e["image"],
              aboutDoctor: e["aboutDoctor"],
            ),
          );
        }
        return doctors;
      }
      return doctors;
    }
  }

  Future<DoctorModel?> getDoctor(String doctorPhone) async {
    if (kDebugMode) {
      final Stream<QuerySnapshot<Object?>> data =
          await _doctorCollectionReferenceTest.snapshots();
      DoctorModel? doctor;
      await for (var element in data) {
        for (var e in element.docs) {
          print(e);
          if (doctorPhone == e["phone"]) {
            doctor = DoctorModel(
              name: e["name"],
              specialty: e["specialty"],
              phone: e["phone"],
              img: e["image"],
              aboutDoctor: e["aboutDoctor"],
              fcmToken: e["fcmToken"],
            );
          }
        }
        print(doctor);
        return doctor;
      }
      return doctor;
    } else {
      final data = await _doctorCollectionReference.snapshots();
      DoctorModel? doctor;
      await for (var element in data) {
        for (var e in element.docs) {
          if (doctorPhone == e["phone"]) {
            doctor = DoctorModel(
              name: e["name"],
              specialty: e["specialty"],
              phone: e["phone"],
              img: e["image"],
              aboutDoctor: e["aboutDoctor"],
              fcmToken: e["FCMToken"],
            );
          }
        }
        return doctor;
      }
      return doctor;
    }
  }
}
