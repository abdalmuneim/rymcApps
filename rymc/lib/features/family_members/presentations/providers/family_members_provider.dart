import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rymc/common/handler/exception.dart';
import 'package:rymc/common/routes/routes.dart';
import 'package:rymc/common/services/navigation_services.dart';
import 'package:rymc/common/utils/utils.dart';
import 'package:rymc/features/auth/domain/entities/user.dart';
import 'package:rymc/features/family_members/domain/use_cases/get_members_use_case.dart';

class FamilyMembersProvider extends ChangeNotifier {
  GetMemberUseCase _getMemberUseCase;
  FamilyMembersProvider(this._getMemberUseCase);

  final BuildContext _context = NavigationService.context;

  List<User> _familyMembers = [];
  List<User> get familyMembers => _familyMembers;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  getMembers() async {
    final result = await _getMemberUseCase();

    result.fold((l) {
      if (l.runtimeType == UnAuthorizedException) {
        _context.pushReplacementNamed(RoutesStrings.login);
      } else {
        Utils.showError(l.message);
      }
    }, (r) {
      _familyMembers = r;
      notifyListeners();
    });
  }

  goToAddMember() async {
    final result = await _context.pushNamed(RoutesStrings.addFamilyMembers);
    if (result != null) {
      notifyListeners();
    }
  }

  goToEditMember(User member) async {
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
