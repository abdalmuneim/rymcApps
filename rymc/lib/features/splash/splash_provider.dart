import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:rymc/common/routes/routes.dart';
import 'package:rymc/common/services/navigation_services.dart';
import 'package:rymc/common/services/network_services.dart';
import 'package:rymc/features/auth/domain/use_cases/is_logged_in_use_case.dart';

class SplashProvider extends ChangeNotifier {
  IsLoggedInUseCase _isLoggedInUseCase;
  final NetworkInfo _networkInfo;

  SplashProvider(this._isLoggedInUseCase, this._networkInfo);

  Future<bool> get isLoggedIn async => await _isLoggedInUseCase();

  Future<void> startTimer() async {
    _networkInfo.initializeNetworkStream();
    Timer(const Duration(seconds: 2), () async => await _navigate());
  }

  _navigate() async {
    final context = NavigationService.context;
    if (await isLoggedIn) {
      context.pushReplacementNamed(RoutesStrings.home);
    } else {
      context.pushReplacement(RoutesStrings.start);
    }
  }
}
