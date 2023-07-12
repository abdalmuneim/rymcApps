import 'dart:async';

import 'package:get/get.dart';
import 'package:rymckiosk/common/app_constant/app_constants.dart';
import 'package:rymckiosk/common/routes/pages.dart';

class LoadCallController extends GetxController {
  /// timer start method
  Timer _timer = Timer(Duration.zero, () {});

  /// timer in seconds
  late Rx<Duration> timerDuration =
      Rx(Duration(seconds: _maximumTimerSeconds.value));

  /// the maximum timer in seconds
  final Rx<int> _maximumTimerSeconds = Rx(AppConstants.timeOutWaitDoctor);
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
  void dispose() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    super.dispose();
  }
}
