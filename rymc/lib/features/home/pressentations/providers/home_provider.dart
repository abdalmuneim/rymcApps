import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rymc/common/routes/routes.dart';
import 'package:rymc/common/services/navigation_services.dart';
import 'package:rymc/common/utils/utils.dart';
import 'package:rymc/features/auth/domain/entities/user.dart';
import 'package:rymc/features/auth/domain/use_cases/get_current_user_use_case.dart';
import 'package:rymc/features/auth/domain/use_cases/log_out_use_case.dart';

class HomeProvider extends ChangeNotifier {
  LogOutUseCase _logOutUseCase;
  GetCurrentUserUseCase _getCurrentUserUseCase;
  HomeProvider(this._logOutUseCase, this._getCurrentUserUseCase);
  final BuildContext context = NavigationService.context;

  navToFamilyMembers() {
    context.pushReplacement(RoutesStrings.familyMembers);
  }

  late User _user;
  User get user => _user;

  start() async {
    final result = await _getCurrentUserUseCase();
    result.fold((l) {
      Utils.showError(l.message);
    }, (r) {
      if (r != null) {
        _user = r;
        notifyListeners();
      }
    });
  }

  logOut() async {
    final result = await _logOutUseCase();
    result.fold((l) {
      Utils.showError(l.message);
    }, (r) {
      context.pushReplacementNamed(RoutesStrings.splash);
    });
  }
}
