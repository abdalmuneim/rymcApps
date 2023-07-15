import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rymc/common/routes/routes.dart';
import 'package:rymc/common/services/navigation_services.dart';
import 'package:rymc/features/auth/data/model/user_model.dart';

class FamilyMembersProvider extends ChangeNotifier {
  final BuildContext _context = NavigationService.context;
  final List<UserModel> _families = [];
  List<UserModel> get families => _families;

  goToAddMember() async {
    final result = await _context.pushNamed(RoutesStrings.addFamilyMembers);
    if (result != null) {
      notifyListeners();
    }
  }

  goToEditMember(UserModel member) async {
    final result = await _context.pushNamed(
      RoutesStrings.editFamilyMembers,
      queryParams: {
        "name": member.name,
        "nationalId": member.nationalId,
      },
    );
    if (result != null) {
      notifyListeners();
    }
  }

  goToHome() {
    _context.pushReplacementNamed(RoutesStrings.home);
  }
}
