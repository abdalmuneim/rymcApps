import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rymc/common/routes/routes.dart';
import 'package:rymc/common/services/navigation_services.dart';

class HomeProvider extends ChangeNotifier {
  final BuildContext _context = NavigationService.context;

  navToFamilyMembers() {
    _context.pushReplacement(RoutesStrings.familyMembers);
  }
}
