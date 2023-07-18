import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rymc/common/services/navigation_services.dart';
import 'package:rymc/common/utils/utils.dart';
import 'package:rymc/features/auth/data/model/user_model.dart';
import 'package:rymc/features/family_members/domain/use_cases/edit_member_use_case.dart';
import 'package:rymc/features/family_members/presentations/providers/family_members_provider.dart';

class EditMemberProvider extends ChangeNotifier {
  EditMemberUseCase _editMemberUseCase;
  EditMemberProvider(this._editMemberUseCase);

  final BuildContext _context = NavigationService.context;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> get globalKey => _globalKey;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final nameTEXT = TextEditingController();
  final nationalIdTEXT = TextEditingController();
  late String nationalId;

  editMemberToFamily() async {
    if (_globalKey.currentState!.validate()) {
      _isLoading = true;
      notifyListeners();

      final result = await _editMemberUseCase(
        name: nameTEXT.text,
        nationalId: nationalIdTEXT.text,
      );
      _isLoading = false;
      notifyListeners();
      result.fold(
        (l) => Utils.showError(l.message),
        (r) {
          Provider.of<FamilyMembersProvider>(_context, listen: false)
                  .familyMembers[Provider.of<FamilyMembersProvider>(_context,
                      listen: false)
                  .familyMembers
                  .indexWhere((element) => element.nationalId == nationalId)] =
              UserModel(
            name: nameTEXT.text,
            nationalId: nationalIdTEXT.text,
          );
          _context.pop(true);
        },
      );
    }
  }

  removeMemberFromFamily(UserModel member) {
    _isLoading = true;
    notifyListeners();
    Provider.of<FamilyMembersProvider>(_context, listen: false)
        .familyMembers
        .removeWhere((element) => element.nationalId == member.nationalId);
    _isLoading = false;
    notifyListeners();
    _context.pop(true);
  }
}
