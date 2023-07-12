import 'package:get/get.dart';
import 'package:rymckiosk/features/thank/thank_controller.dart';

class ThankBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThankController>(() => ThankController());
  }
}
