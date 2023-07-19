import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rymc/common/resources/app_color.dart';
import 'package:rymc/common/routes/routes.dart';
import 'package:rymc/common/services/navigation_services.dart';
import 'package:rymc/common/services/network_services.dart';
import 'package:rymc/common/utils/utils.dart';
import 'package:rymc/features/auth/domain/entities/user.dart';
import 'package:rymc/features/auth/domain/use_cases/get_current_user_use_case.dart';
import 'package:rymc/features/auth/domain/use_cases/log_out_use_case.dart';
import 'package:rymc/features/auth/presentations/providers/login_provider.dart';
import 'package:rymc/generated/assets/assets.dart';
import 'package:rymc/generated/l10n.dart';

class HomeProvider extends ChangeNotifier {
  LogOutUseCase _logOutUseCase;
  GetCurrentUserUseCase _getCurrentUserUseCase;
  final NetworkInfo _networkInfo;

  HomeProvider(
      this._networkInfo, this._logOutUseCase, this._getCurrentUserUseCase);
  final BuildContext _context = NavigationService.context;
  String _qrCodeData = '11111 11 111 111111';
  String get qrCodeData => _qrCodeData;

  User? _user;
  User? get user => _user;

  start() async {
    await _listenToNetWork();
    final result = await _getCurrentUserUseCase();
    result.fold((l) {
      Utils.showError(l.message);
    }, (r) {
      if (r != null) {
        _user = r;
        _qrCodeData =
            "${S.of(_context).name}: ${user?.name}\n${S.of(_context).phoneNumber}: ${user?.phone}\n${S.of(_context).nationalID}: ${user?.nationalId}";
        notifyListeners();
      }
    });
  }

  navToFamilyMembers() {
    _context.pushReplacement(RoutesStrings.familyMembers);
  }

  goToNotificationView() {
    _context.pushNamed(RoutesStrings.notification);
  }

  logOut() async {
    final result = await _logOutUseCase();
    result.fold((l) {
      Utils.showError(l.message);
    }, (r) {
      _context.pushReplacementNamed(RoutesStrings.login);
    });
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

  @override
  void dispose() {
    Provider.of<LogInProvider>(_context, listen: false).dispose();
    super.dispose();
  }

  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Utils.showToast(S.of(_context).pressAgainToExit,
          backgroundColor: AppColors.black.withOpacity(.3));
      return Future.value(false);
    }
    exit(0);
  }
}
