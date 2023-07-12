import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:rymc/common/routes/routes.dart';
import 'package:rymc/common/services/navigation_services.dart';

class StartProvider extends ChangeNotifier {
  StartProvider();
  navigate() async {
    final context = NavigationService.context;
    context.pushReplacementNamed(RoutesStrings.login);
  }
}
