import 'package:get/get.dart';
import 'package:rymckiosk/features/home_feature/presentations/controllers/home_controller.dart';
import 'package:rymckiosk/injection.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(sl()));
  }
}
