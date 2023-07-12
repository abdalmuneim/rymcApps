import 'package:get/get.dart';
import 'package:rymckiosk/common/routes/pages.dart';
import 'package:rymckiosk/common/services/device_id.dart';
import 'package:rymckiosk/common/utils/fields.dart';
import 'package:rymckiosk/features/home_feature/data/models/admin_model.dart';
import 'package:rymckiosk/common/services/firebase_service/admin_collection.dart';
import 'package:rymckiosk/common/services/network_service.dart';
import 'package:rymckiosk/common/utils/utils.dart';
import 'package:rymckiosk/features/home_feature/presentations/pages/widgets/send_fcm/send_fcm_controller.dart';
import 'package:rymckiosk/features/home_feature/presentations/pages/widgets/send_fcm/send_fcm_widget.dart';
import 'package:rymckiosk/generated/assets/assets.dart';
import 'package:rymckiosk/generated/l10n.dart';
import 'package:rymckiosk/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  NetworkInfo _networkInfo;
  HomeController(this._networkInfo);

  addAdmin() async {
    await FireStoreAdmin().addAdminToFireStore(
      admin: AdminModel(
        phone: "111111111",
        password: "1223334444",
        deviceId: await DeviceIdService.instance.getDeviceId(),
      ),
    );
  }

  navigateToDoctors() {
    Get.toNamed(Routes.doctors);
  }

  isFirstOpen() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final loginDoctor = await sharedPreferences.get(Fields.loginDoctor);
    final loginUser = await sharedPreferences.get(Fields.loginUser);
    print("loginUser:$loginUser");
    print("loginDoctor: $loginDoctor");
    if (loginDoctor == null && loginUser == null) {
      Get.dialog(barrierDismissible: false, SendFcm());
    }
  }

  @override
  void onInit() async {
    _networkInfo.initializeNetworkStream();
    await Get.put(SendFCMController(fcmNotificationFirebase: sl()));
    await isFirstOpen();
    super.onInit();
  }

  @override
  void onReady() async {
    _listenToNetWork();
    super.onReady();
  }

  _listenToNetWork() {
    _networkInfo.listenToNetworkStream.onData((bool isConnect) {
      if (isConnect) {
        Get.back();
      } else {
        Utils.showLottieDialog(
            lottie: Assets.assetsAnimationsNoConnectionToInternet,
            text: S.of(Get.context!).noInternetConnection);
      }
    });
  }
}
