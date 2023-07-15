import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rymc/common/app_constant/app_constants.dart';
import 'package:rymc/common/routes/routes.dart';
import 'package:rymc/common/services/navigation_services.dart';
import 'package:rymc/common/utils/utils.dart';
import 'package:rymc/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:rymc/generated/l10n.dart';

class LoginProvider extends ChangeNotifier {
  SignInUseCase _signInUseCase;

  LoginProvider(this._signInUseCase);

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> get globalKey => _globalKey;
  final context = NavigationService.context;
  final phoneTEXT = TextEditingController();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  sendValidateCode() async {
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
        context.pushNamed(RoutesStrings.otp);
      });
    } else {
      Utils.showError(S.of(context).phoneNumber);
    }
  }
}
