import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rymc/common/routes/routes.dart';
import 'package:rymc/common/services/navigation_services.dart';
import 'package:rymc/common/utils/utils.dart';
import 'package:rymc/generated/l10n.dart';

class OtpProvider extends ChangeNotifier {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> get globalKey => _globalKey;
  final context = NavigationService.context;
  final codeTEXT = TextEditingController();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  verificationCode() {
    if (_globalKey.currentState!.validate()) {
      _isLoading = true;
      notifyListeners();

      /// TODO: check code verification and send to firebas and check if user already exists go to home other go to login
      Future.delayed(const Duration(seconds: 2), () {
        context.pushReplacement(RoutesStrings.register);
        _isLoading = false;
        notifyListeners();
      });
    } else {
      Utils.showError(S.of(context).phoneNumber);
    }
  }
}
