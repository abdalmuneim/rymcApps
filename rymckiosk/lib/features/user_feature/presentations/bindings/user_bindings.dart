import 'package:get/get.dart';
import 'package:rymckiosk/features/user_feature/presentations/controllers/user_controller.dart';
import 'package:rymckiosk/injection.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(
        () => UserController(fcmNotificationFirebase: sl()));
  }
}
