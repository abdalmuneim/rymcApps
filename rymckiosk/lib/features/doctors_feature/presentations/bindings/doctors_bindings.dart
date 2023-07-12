import 'package:get/get.dart';
import 'package:rymckiosk/features/doctors_feature/presentations/controllers/doctors_controller.dart';

class DoctorsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorsController>(() => DoctorsController());
  }
}
