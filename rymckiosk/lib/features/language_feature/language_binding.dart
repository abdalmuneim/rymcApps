import 'package:get/get.dart';
import 'package:rymckiosk/features/language_feature/language_controller.dart';

class LocalizationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalizationController>(() => LocalizationController());
  }
}
