import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rymc/common/routes/routes.dart';
import 'package:rymc/common/services/fcm_firemessaging.dart';
import 'package:rymc/common/services/navigation_services.dart';
import 'package:rymc/common/utils/utils.dart';
import 'package:rymc/features/auth/domain/use_cases/register_use_case.dart';
import 'package:rymc/generated/l10n.dart';

class RegisterProvider extends ChangeNotifier {
  RegisterUseCase _registerUseCase;
  IFCMNotificationFirebase _fcmNotificationFirebase;
  RegisterProvider(this._registerUseCase, this._fcmNotificationFirebase);

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> get globalKey => _globalKey;
  final context = NavigationService.context;
  final nationalIdTEXT = TextEditingController();
  final nameTEXT = TextEditingController();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<String> getFCM() async {
    final fcm = await _fcmNotificationFirebase.getFCMToken() ?? "";
    log(fcm);
    return fcm;
  }

  register() async {
    if (_globalKey.currentState!.validate()) {
      _isLoading = true;
      notifyListeners();
      final result = await _registerUseCase(
          fcm: await getFCM(),
          name: nameTEXT.text,
          nationalId: nationalIdTEXT.text);
      _isLoading = false;
      notifyListeners();
      result.fold((l) => Utils.showError(l.message), (r) {
        context.pushNamed(RoutesStrings.home);
        Utils.showSuccess(S.of(context).createdAccountSuccess);
      });
    } else {
      Utils.showError(S.of(context).checkAllFields);
    }
  }
}
