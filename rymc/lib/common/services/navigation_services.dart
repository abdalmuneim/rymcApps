import 'package:flutter/material.dart';
import 'package:rymc/common/routes/routes.dart';

class NavigationService {
  static BuildContext get context =>
      Routes.router.routerDelegate.navigatorKey.currentContext!;
}
