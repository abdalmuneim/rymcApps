import 'dart:async';

import 'package:get/get.dart';
import 'package:rymckiosk/common/routes/pages.dart';
import 'package:rymckiosk/common/services/app_permissions.dart';
import 'package:rymckiosk/common/services/network_service.dart';
import 'package:rymckiosk/common/utils/fields.dart';
import 'package:rymckiosk/common/utils/utils.dart';
import 'package:rymckiosk/features/language_feature/language_controller.dart';
import 'package:rymckiosk/generated/l10n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  final NetworkInfo _networkInfo;
  SplashController(this._networkInfo);

  _startTimer() async {
    Timer(Duration(seconds: 2), () {
      _navigate();
    });
  }

  _navigate() async {
    if (await loadLang()) {
      Get.offAllNamed(Routes.home);
    } else {
      Get.offAllNamed(Routes.localization);
    }
  }

  Future<bool> loadLang() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final languageCode = sharedPreferences.getString(Fields.getLang);
    final countryCode = sharedPreferences.getString(Fields.getLang);
    print(languageCode);
    if (languageCode != null && countryCode != null) {
      return true;
    }
    return false;
  }

  @override
  void onInit() async {
    Get.put(LocalizationController());
    await AppPermissions();
    _networkInfo.initializeNetworkStream();
    await _listenToNetWork();
    super.onInit();
  }

  _listenToNetWork() {
    _networkInfo.listenToNetworkStream.onData((bool isConnect) {
      if (isConnect) {
        Get.back();
        _startTimer();
      } else {
        Utils.showBottomSheet(title: S.of(Get.context!).noInternetConnection);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
