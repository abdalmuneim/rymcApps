import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rymckiosk/common/routes/pages.dart';
import 'package:rymckiosk/common/services/firebase_service/firebase_error_hander.dart';
import 'package:rymckiosk/common/utils/fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationController extends GetxController implements GetxService {
  late SharedPreferences _sharedPreferences;

  final RxString _selectedLang = "".obs;
  RxString get selectedLang => _selectedLang;

  void setLanguage(String locale) {
    if (locale.isNotEmpty) {
      Get.updateLocale(Locale(locale));
      _selectedLang.value = locale;
      print(_selectedLang.value);
      saveLanguage(locale);
      update();
    }
  }

  void loadCurrentLanguage() async {
    try {
      _selectedLang.value = _sharedPreferences.getString(Fields.getLang) ?? "";
      print(_selectedLang.value);
      print(Get.deviceLocale);
      setLanguage(_selectedLang.value);
    } catch (e) {
          FirebaseErrorsHandel.instance.pushErrorToFireStore(e, e.runtimeType, LocalizationController);

      rethrow;
    }
  }

  void saveLanguage(String locale) async {
    await _sharedPreferences.setString(Fields.getLang, locale);
  }

  navigate() async {
    try {
      Get.offAllNamed(Routes.home);
    } catch (e) {
      FirebaseErrorsHandel.instance
          .pushErrorToFireStore(e, e.runtimeType, LocalizationController);
      print(e);
    }
  }

  @override
  void onInit() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    loadCurrentLanguage();
    super.onInit();
  }
}
