import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rymc/common/routes/routes.dart';
import 'package:rymc/common/services/navigation_services.dart';
import 'package:rymc/common/utils/utils.dart';
import 'package:rymc/generated/l10n.dart';

class LoginProvider extends ChangeNotifier {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> get globalKey => _globalKey;
  final context = NavigationService.context;
  final phoneTEXT = TextEditingController();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  sendValidateCode() {
    if (_globalKey.currentState!.validate()) {
      _isLoading = true;
      notifyListeners();

      /// TODO: send requist otp to firebase
      Future.delayed(const Duration(seconds: 2), () {
        context.pushNamed(RoutesStrings.otp);
        _isLoading = false;
        notifyListeners();
      });
    } else {
      Utils.showError(S.of(context).phoneNumber);
    }
  }
}
