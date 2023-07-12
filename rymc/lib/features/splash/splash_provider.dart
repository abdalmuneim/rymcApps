import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:rymc/common/routes/routes.dart';
import 'package:rymc/common/services/navigation_services.dart';

class SplashProvider extends ChangeNotifier {
  SplashProvider();

  Future<void> startTimer() async {
    /// TODO: check if user loged in befor save his number in local and get user data from firebase
    Timer(const Duration(seconds: 3), () async => await _navigate());
  }

  _navigate() async {
    final context = NavigationService.context;
    context.pushReplacementNamed(RoutesStrings.start);
  }
}
