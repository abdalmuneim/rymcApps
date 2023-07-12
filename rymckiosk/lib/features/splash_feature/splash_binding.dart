import 'package:get/get.dart';
import 'package:rymckiosk/features/splash_feature/splash_controller.dart';
import 'package:rymckiosk/injection.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(sl()));
  }
}
