import 'package:get/get.dart';
import 'package:rymckiosk/features/load_call/load_call_controller.dart';

class LoadCallBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoadCallController>(() => LoadCallController());
  }
}
