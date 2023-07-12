import 'dart:async';

import 'package:flutter/material.dart';

class TimerDown {
  Timer _timer = Timer(Duration.zero, () {});

  startTimer(ValueChanged<Timer> onChangedTimer) {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      onChangedTimer(timer);
    });
  }

  dispose() {
    if (_timer.isActive) {
      _timer.cancel();
    }
  }
}
