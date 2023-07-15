import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rymc/common/routes/routes.dart';
import 'package:rymc/common/services/navigation_services.dart';
import 'package:rymc/common/utils/utils.dart';
import 'package:rymc/features/auth/domain/use_cases/is_sign_in_before_use_case.dart';
import 'package:rymc/features/auth/domain/use_cases/verify_code_use_case.dart';
import 'package:rymc/generated/l10n.dart';

class OtpProvider extends ChangeNotifier {
  VerifyCodeUseCase _verifyCodeUseCase;
  IsSignInBeforeUseCase _isSignInBeforeUseCase;
  OtpProvider(this._verifyCodeUseCase, this._isSignInBeforeUseCase);

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> get globalKey => _globalKey;
  final context = NavigationService.context;
  final codeTEXT = TextEditingController();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  /// timer in seconds
  late Duration timerDuration = Duration(seconds: _maximumTimerSeconds);

  /// the maximum timer in seconds
  final int _maximumTimerSeconds = 120;

  /// timer instance
  Timer _timer = Timer(Duration.zero, () {});

  verificationCode() async {
    if (_globalKey.currentState!.validate()) {
      _isLoading = true;
      notifyListeners();

      final result = await _verifyCodeUseCase(sms: codeTEXT.text);

      result.fold(
        (l) => Utils.showError(l.message),
        (r) async {
          final isSigning = await _isSignInBeforeUseCase();
          _isLoading = false;
          notifyListeners();
          isSigning.fold(
            (err) => Utils.showError(err.message),
            (user) {
              if (user != null) {
                context.pushReplacement(RoutesStrings.home);
              } else {
                context.pushReplacement(RoutesStrings.register);
              }
            },
          );
        },
      );
    } else {
      Utils.showError(S.of(context).phoneNumber);
    }
  }
}
