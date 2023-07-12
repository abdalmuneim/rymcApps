import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseUploadFile {
  static FirebaseUploadFile _init = FirebaseUploadFile();
  static FirebaseUploadFile instance = _init;

  FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> uploadImageFile(File file, String doctorPhone) async {
    try {
      String filename = DateTime.now().microsecondsSinceEpoch.toString();
      Reference ref =
          _storage.ref().child('DoctorImages' + doctorPhone).child(filename);
      await ref.putFile(file);
      String imageUrl = await ref.getDownloadURL();
      print(imageUrl);
      return imageUrl;
    } catch (e) {
      print('Error-->$e');
      return null;
    }
  }
}
