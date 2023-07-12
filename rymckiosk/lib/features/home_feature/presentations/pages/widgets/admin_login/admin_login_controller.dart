import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rymckiosk/common/routes/pages.dart';
import 'package:rymckiosk/features/home_feature/data/models/admin_model.dart';
import 'package:rymckiosk/common/services/firebase_service/admin_collection.dart';
import 'package:rymckiosk/generated/l10n.dart';

class AdminLoginController extends GetxController {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> get globalKey => _globalKey;
  final password = TextEditingController();
  final adminPhone = TextEditingController();
  List<AdminModel> _admin = [];

  navigateToAdmin() {
    if (_globalKey.currentState!.validate()) {
      FocusScope.of(Get.context!).unfocus();
      Get.back();
      password.clear();
      Get.toNamed(
        Routes.addDoctor,
      );
    }
  }

  Future<List<AdminModel>> getAdmin() async {
    _admin = await FireStoreAdmin().getAdminFromFireStore();
    // update();
    return _admin;
  }

  @override
  void onInit() async {
    await getAdmin();
    super.onInit();
  }

  String? validatorPasswordAdmin(String? value) {
    if (value == null && value!.isEmpty) {
      return S.of(Get.context!).validPassword;
    }
    bool isExists = _admin.any((element) => element.password == value);
    if (!isExists) {
      return S.of(Get.context!).notEXistsPass;
    }

    return null;
  }

  String? validatorPhonedAdmin(String? value) {
    if (value == null && value!.isEmpty) {
      return S.of(Get.context!).validPhone;
    }
    bool isExists = _admin.any((element) => element.phone == value);
    if (!isExists) {
      return S.of(Get.context!).phoneNotExists;
    }

    return null;
  }
}
