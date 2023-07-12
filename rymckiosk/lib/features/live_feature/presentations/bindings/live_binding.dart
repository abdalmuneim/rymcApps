import 'package:get/get.dart';
import 'package:rymckiosk/features/live_feature/presentations/controllers/live_controller.dart';

class LiveBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LiveController>(() => LiveController());
  }
}
