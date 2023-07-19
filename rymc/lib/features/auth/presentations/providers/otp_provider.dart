import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rymc/common/app_constant/app_constants.dart';
import 'package:rymc/common/handler/failure.dart';
import 'package:rymc/common/routes/routes.dart';
import 'package:rymc/common/services/fcm_firemessaging.dart';
import 'package:rymc/common/services/navigation_services.dart';
import 'package:rymc/common/services/server_service.dart';
import 'package:rymc/common/utils/fields.dart';
import 'package:rymc/common/utils/utils.dart';
import 'package:rymc/features/auth/domain/entities/user.dart';
import 'package:rymc/features/auth/domain/use_cases/is_sign_in_before_use_case.dart';
import 'package:rymc/features/auth/domain/use_cases/register_use_case.dart';
import 'package:rymc/features/auth/domain/use_cases/resend_otp_use_case.dart';
import 'package:rymc/features/auth/domain/use_cases/verify_code_use_case.dart';
import 'package:rymc/features/auth/presentations/providers/login_provider.dart';
import 'package:rymc/generated/l10n.dart';

class OtpProvider extends ChangeNotifier {
  VerifyCodeUseCase _verifyCodeUseCase;
  IsSignInBeforeUseCase _isSignInBeforeUseCase;
  RegisterUseCase _registerUseCase;
  ResendOTPUseCase _resendOTPUseCase;
  IFCMNotificationFirebase _fcmNotificationFirebase;

  OtpProvider(
      this._verifyCodeUseCase,
      this._isSignInBeforeUseCase,
      this._registerUseCase,
      this._fcmNotificationFirebase,
      this._resendOTPUseCase);

  final GlobalKey<FormState> _globalKeyOTP =
      GlobalKey<FormState>(debugLabel: "OTP");
  GlobalKey<FormState> get globalKey => _globalKeyOTP;

  final _context = NavigationService.context;
  final codeTEXT = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isLoadingResend = false;
  bool get isLoadingResent => _isLoadingResend;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// come from firebase
  String _verificationId = '';

  /// come from firebase
  int? _forceResendingToken;

  /// timer in seconds
  late Duration timerDuration = Duration(seconds: _maximumTimerSeconds);

  /// the maximum timer in seconds
  final int _maximumTimerSeconds = AppConstants.timeOut;

  /// timer instance
  Timer _timer = Timer(Duration.zero, () {});

  _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      log("duration: ${timerDuration.inSeconds.toString()}");
      log("timer: ${timer.tick.toString()}");
      if (timer.tick >= _maximumTimerSeconds) {
        timer.cancel();
        timerDuration = Duration(seconds: _maximumTimerSeconds);
        notifyListeners();
        // context.pop();
      } else {
        timerDuration = Duration(seconds: _maximumTimerSeconds - timer.tick);
        notifyListeners();
      }
    });
  }

  verificationCode() async {
    if (_globalKeyOTP.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();

      _isLoading = true;
      notifyListeners();
      try {
        final PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: Provider.of<LogInProvider>(_context, listen: false)
                .verificationId,
            smsCode: codeTEXT.text);

        UserCredential user =
            await FirebaseAuth.instance.signInWithCredential(credential);

        if (user.user?.uid != null) {
          final result = await _verifyCodeUseCase(sms: user.user!.uid);
          result.fold(
            (l) => Utils.showError(l.message),
            (r) async {
              final Either<Failure, User?> isSigning =
                  await _isSignInBeforeUseCase();
              _isLoading = false;
              notifyListeners();
              isSigning.fold(
                (err) => Utils.showError(err.message),
                (User? user) async {
                  clear();
                  if (user != null) {
                    final register = await _registerUseCase(
                      name: user.name!,
                      nationalId: user.nationalId!,
                      fcm: await _fcmNotificationFirebase.getFCMToken() ?? "",
                    );
                    register.fold(
                      (l) => Utils.showError(l.message),
                      (r) {
                        _context.pushReplacementNamed(RoutesStrings.home);

                        Utils.showSuccess(S.of(_context).welcomeBack);
                      },
                    );
                  } else {
                    _context.pushReplacementNamed(RoutesStrings.register);
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
      Utils.showError(S.of(_context).phoneNumber);
    }
  }

  resendOTP() async {
    _isLoadingResend = true;
    notifyListeners();
    final result = await _resendOTPUseCase();
    result.fold(
      (l) => Utils.showError(l.message),
      (phone) async {
        try {
          await _firebaseAuth.verifyPhoneNumber(
            phoneNumber: phone.trim(),
            forceResendingToken: _forceResendingToken,
            codeSent: (String verificationId, int? forceResendingToken) async {
              log(" ---> Sent");
              _isLoadingResend = false;
              _startTimer();
            },
            codeAutoRetrievalTimeout: (String verificationId) {
              _verificationId = verificationId;
            },
            timeout: Duration(seconds: AppConstants.timeOut),
            verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
            verificationFailed: (FirebaseAuthException error) {
              log(" Error---> $error");
              _isLoadingResend = false;
              notifyListeners();
              if (error.code == Fields.invalidPhoneNumber) {
                Utils.showError('Invalid phone number');
              } else {
                Utils.showError(error.message ?? "Error Sent code");
              }
            },
          );
        } on SocketException {
          ServerService<void>().timeOutMethod(
            () => resendOTP(),
          );
        } catch (e) {
          _isLoadingResend = false;
          notifyListeners();
          Utils.showError(e.toString());
        }
      },
    );
  }

  void clear() {
    codeTEXT.clear();
    _timer.cancel();
  }

  init() {
    _startTimer();
  }
}
