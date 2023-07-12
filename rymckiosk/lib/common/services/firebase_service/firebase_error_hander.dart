import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseErrorsHandel {
  static FirebaseErrorsHandel _init = FirebaseErrorsHandel();
  static FirebaseErrorsHandel instance = _init;
  final CollectionReference _doctorCollectionReference =
      FirebaseFirestore.instance.collection('Errors in App');

  Future<void> pushErrorToFireStore(
          Object error, Type runTimeType, Object screen) async =>
      await _doctorCollectionReference
          .doc(Timestamp.now().microsecondsSinceEpoch.toString())
          .set({
        "error": error,
        "time": DateTime.now().toString(),
        "runTimeType": runTimeType,
        "screen": screen
      });
}
