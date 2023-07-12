import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rymckiosk/common/services/firebase_service/doctors_collections.dart';
import 'package:rymckiosk/common/services/firebase_service/firebase_error_hander.dart';
import 'dart:io';

import 'package:rymckiosk/common/utils/pic_image.dart';
import 'package:rymckiosk/common/services/firebase_service/firebase_upload_file_repo.dart';
import 'package:rymckiosk/features/doctors_feature/data/models/doctors_model.dart';
import 'package:rymckiosk/generated/l10n.dart';

class AddDoctorController extends GetxController {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> get globalKey => _globalKey;
  TextEditingController doctorPhoneTEXT = TextEditingController();
  TextEditingController doctorNameTEXT = TextEditingController();
  TextEditingController doctorSpecialtyTEXT = TextEditingController();
  TextEditingController aboutDoctorTEXT = TextEditingController();

  File? _doctorImage;
  File? get doctorImage => _doctorImage;
  String _validImage = "";
  String get validImage => _validImage;

  getImage() async {
    _doctorImage = await ImagePic.showBottomSheetPic();
    update();
    if (_doctorImage != null) {
      _validImage = "";
      update();
    }
  }

  save() async {
    if (_doctorImage == null) {
      _validImage = S.of(Get.context!).imageRequired;
      update();
      return;
    }
    if (_globalKey.currentState!.validate()) {
      _isLoading = true;
      update();
      try {
        final String? imageURL = await FirebaseUploadFile.instance
            .uploadImageFile(doctorImage!, doctorPhoneTEXT.text);

        await FireStoreCollectionDoctors.instance.addDoctorToFireStore(
          DoctorModel(
            name: doctorNameTEXT.text,
            phone: doctorPhoneTEXT.text,
            img: imageURL,
            specialty: doctorSpecialtyTEXT.text,
            aboutDoctor: aboutDoctorTEXT.text,
            createdAt: DateTime.now().toString(),
          ),
        );
        clearFields();
        _isLoading = false;
        update();
      } catch (e) {
        print(e);
        FirebaseErrorsHandel.instance
            .pushErrorToFireStore(e, e.runtimeType, AddDoctorController);
        _isLoading = false;
        update();
      }
    }
  }

  @override
  void dispose() {
    clearFields();
    super.dispose();
  }

  clearFields() {
    doctorNameTEXT.clear();
    doctorSpecialtyTEXT.clear();
    doctorPhoneTEXT.clear();
    aboutDoctorTEXT.clear();
    _doctorImage = null;
  }
}
