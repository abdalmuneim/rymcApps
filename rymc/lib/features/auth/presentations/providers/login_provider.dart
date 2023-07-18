import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rymc/common/app_constant/app_constants.dart';
import 'package:rymc/common/routes/routes.dart';
import 'package:rymc/common/services/navigation_services.dart';
import 'package:rymc/common/services/network_services.dart';
import 'package:rymc/common/services/server_service.dart';
import 'package:rymc/common/utils/fields.dart';
import 'package:rymc/common/utils/utils.dart';
import 'package:rymc/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:rymc/generated/assets/assets.dart';
import 'package:rymc/generated/l10n.dart';

class LogInProvider extends ChangeNotifier {
  SignInUseCase _signInUseCase;
  final NetworkInfo _networkInfo;

  LogInProvider(this._signInUseCase, this._networkInfo);
  final _context = NavigationService.context;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  /// come from firebase
  String _verificationId = '';
  String get verificationId => _verificationId;

  /// come from firebase
  int? forceResendingToken;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> get globalKey => _globalKey;

  final phoneTEXT = TextEditingController();
  final countryCodeTEXT = TextEditingController(text: AppConstants.countryCode);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  /*  sendValidateCode() async {
    if (_globalKey.currentState!.validate()) {
      _isLoading = true;
      notifyListeners();
      final result = await _signInUseCase(
          phone: "${AppConstants.countryCode}${phoneTEXT.text.trim()}");
      _isLoading = false;
      notifyListeners();
      result.fold((l) {
        Utils.showError(l.message);
      }, (r) {
        Utils.showSuccess(S.of(context).otpCodeSent);
      });
    } else {
      Utils.showError(S.of(context).phoneNumber);
    }
  } */
  init() async {
    await _listenToNetWork();
  }

  sendValidateCode() async {
    if (_globalKey.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      _isLoading = true;
      notifyListeners();
      try {
        await firebaseAuth.verifyPhoneNumber(
          phoneNumber: "${countryCodeTEXT.text}${phoneTEXT.text.trim()}",
          forceResendingToken: forceResendingToken,
          codeSent: (String verificationId, int? forceResendingToken) async {
            log(" ---> Sent");
            final result = await _signInUseCase(
                phone: "${AppConstants.countryCode}${phoneTEXT.text.trim()}");
            _isLoading = false;
            notifyListeners();
            result.fold(
              (l) => Utils.showError(l.message),
              (r) {
                _context.pushNamed(RoutesStrings.otp);
                _verificationId = verificationId;
                forceResendingToken = forceResendingToken;
                notifyListeners();
                Utils.showSuccess(S.of(_context).otpCodeSent);
                clear();
              },
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            _verificationId = verificationId;
          },
          timeout: Duration(seconds: AppConstants.timeOut),
          verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
          verificationFailed: (FirebaseAuthException error) {
            log(" Error---> $error");
            _isLoading = false;
            notifyListeners();
            if (error.code == Fields.invalidPhoneNumber) {
              Utils.showError('time Out');
            } else {
              Utils.showError(error.message ?? "Error Sent code");
            }
          },
        );
      } on SocketException {
        ServerService<void>().timeOutMethod(
          () => sendValidateCode(),
        );
      } catch (e) {
        Utils.showError(e.toString());
      }
    } else {
      Utils.showError(S.of(_context).phoneNumber);
    }
  }

  _listenToNetWork() {
    _networkInfo.listenToNetworkStream.onData((bool isConnect) {
      if (isConnect) {
        _context.pop();
      } else {
        Utils.showLottieDialog(
            lottie: Assets.assetsAnimationsNoConnectionToInternet,
            text: S.of(_context).noInternetConnection);
      }
    });
  }

  void clear() {
    phoneTEXT.clear();
  }
}
