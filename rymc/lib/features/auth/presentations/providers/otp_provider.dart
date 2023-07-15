import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rymc/common/routes/routes.dart';
import 'package:rymc/common/services/navigation_services.dart';
import 'package:rymc/common/services/server_service.dart';
import 'package:rymc/common/utils/utils.dart';
import 'package:rymc/features/auth/domain/entities/user.dart';
import 'package:rymc/features/auth/domain/use_cases/is_sign_in_before_use_case.dart';
import 'package:rymc/features/auth/domain/use_cases/verify_code_use_case.dart';
import 'package:rymc/features/auth/presentations/providers/login_provider.dart';
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
      FocusManager.instance.primaryFocus?.unfocus();

      _isLoading = true;
      notifyListeners();
      try {
        final PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: Provider.of<LogInProvider>(context, listen: false)
                .verificationId,
            smsCode: codeTEXT.text);

        UserCredential user =
            await FirebaseAuth.instance.signInWithCredential(credential);

        if (user.user?.uid != null) {
          final result = await _verifyCodeUseCase(sms: user.user!.uid);
          result.fold(
            (l) => Utils.showError(l.message),
            (r) async {
              final isSigning = await _isSignInBeforeUseCase();
              _isLoading = false;
              notifyListeners();
              isSigning.fold(
                (err) => Utils.showError(err.message),
                (User? user) {
                  if (user != null) {
                    context.pushReplacementNamed(RoutesStrings.home);
                    Utils.showSuccess(S.of(context).welcomeBack);
                  } else {
                    context.pushReplacementNamed(RoutesStrings.register);
                  }
                },
              );
            },
          );
        }
      } on SocketException {
        return ServerService<String>().timeOutMethod(() => verificationCode());
      } catch (e) {
        Utils.showError(e.toString());
      }
    } else {
      Utils.showError(S.of(context).phoneNumber);
    }
  }

  void clear() {
    codeTEXT.clear();
  }
}
