import 'package:get/get.dart';
import 'package:rymckiosk/features/adddoctor_feature/presentations/controllers/adddoctor_controller.dart';

class AddDoctorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddDoctorController>(() => AddDoctorController());
  }
}
