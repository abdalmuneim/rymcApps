import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rymckiosk/common/app_constant/app_constants.dart';
import 'package:rymckiosk/common/routes/pages.dart';
import 'package:rymckiosk/features/doctors_feature/data/models/doctors_model.dart';
import 'package:rymckiosk/common/services/firebase_service/doctors_collections.dart';

class DoctorsController extends GetxController {
  PageController? controller = PageController();
  List<DoctorModel> _allDoctors = [];
  List<DoctorModel> get allDoctors => _allDoctors;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  /// timer in seconds
  late Rx<Duration> timerDuration =
      Rx(Duration(seconds: _maximumTimerSeconds.value));

  /// the maximum timer in seconds
  final Rx<int> _maximumTimerSeconds = Rx(AppConstants.timeOut);

  int _currentPage = 0;
  int get currentPage => _currentPage;

  Future<List<DoctorModel>> _getAllDoctors() async {
    _isLoading = true;
    update();
    _allDoctors = await FireStoreCollectionDoctors.instance.getDoctors();
    _isLoading = false;
    update();
    return _allDoctors;
  }

  onPageChanged(int index) {
    _currentPage = index;
    update();
  }

  navigate(DoctorModel doctor) {
    Get.offNamed(
      Routes.user,
      arguments: {"doctor": doctor},
    );
  }

  /// timer start method
  Timer _timer = Timer(Duration.zero, () {});

  _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      print(timer.tick);
      if (timer.tick >= _maximumTimerSeconds.value) {
        timer.cancel();
        timerDuration.value = Duration(seconds: _maximumTimerSeconds.value);
        update();
        Get.offAllNamed(Routes.home);
      } else {
        timerDuration.value =
            Duration(seconds: _maximumTimerSeconds.value - timer.tick);
        update();
      }
    });
  }

  @override
  void onInit() async {
    await _getAllDoctors();
    _startTimer();
    super.onInit();
  }

  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete {
    if (_timer.isActive) {
      _timer.cancel();
    }
    return super.onDelete;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
