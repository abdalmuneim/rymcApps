import 'dart:async';

import 'package:get/get.dart';
import 'package:rymckiosk/common/app_constant/app_constants.dart';
import 'package:rymckiosk/common/routes/pages.dart';
import 'package:rymckiosk/common/services/timer.dart';

class ThankController extends GetxController {
  /// timer in seconds
  late Rx<Duration> timerDuration =
      Rx(Duration(seconds: _maximumTimerSeconds.value));

  /// the maximum timer in seconds
  final Rx<int> _maximumTimerSeconds = Rx(AppConstants.timeOutThank);

  /// timer start method
  _startTimer() {
    TimerDown().startTimer((Timer timer) {
      if (timer.tick >= _maximumTimerSeconds.value) {
        timer.cancel();
        timerDuration.value = Duration(seconds: _maximumTimerSeconds.value);
        navigate();
      } else {
        timerDuration.value =
            Duration(seconds: _maximumTimerSeconds.value - timer.tick);
      }
    });
  }

  navigate() => Get.offAllNamed(Routes.home);

  @override
  void onInit() {
    _startTimer();

    super.onInit();
  }
}
