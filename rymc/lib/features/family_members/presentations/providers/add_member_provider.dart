import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rymc/common/services/navigation_services.dart';
import 'package:rymc/common/utils/utils.dart';
import 'package:rymc/features/auth/data/model/user_model.dart';
import 'package:rymc/features/family_members/domain/use_cases/add_member_use_case.dart';
import 'package:rymc/features/family_members/presentations/providers/family_members_provider.dart';
import 'package:rymc/generated/l10n.dart';

class AddMemberProvider extends ChangeNotifier {
  AddMemberUseCase _addMemberUseCase;
  AddMemberProvider(this._addMemberUseCase);

  final BuildContext _context = NavigationService.context;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> get globalKey => _globalKey;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final nameTEXT = TextEditingController();
  final nationalIdTEXT = TextEditingController();

  addMemberToFamily() async {
    if (_globalKey.currentState!.validate()) {
      _isLoading = true;
      notifyListeners();
      final bool check =
          Provider.of<FamilyMembersProvider>(_context, listen: false)
              .familyMembers
              .any((element) => element.nationalId == nameTEXT.text);
      if (check) {
        Utils.showError(
          S.of(_context).memberIsAlreadyExists(nationalIdTEXT.text),
        );
      } else {
        final result = await _addMemberUseCase(
          name: nameTEXT.text,
          nationalId: nationalIdTEXT.text,
        );
        _isLoading = false;
        notifyListeners();
        result.fold(
          (l) => Utils.showError(l.message),
          (r) {
            Provider.of<FamilyMembersProvider>(_context, listen: false)
                .familyMembers
                .add(
                  UserModel(
                    name: nameTEXT.text,
                    nationalId: nationalIdTEXT.text,
                  ),
                );

            _context.pop(true);
            clearFields();
          },
        );
      }
    }
  }

  clearFields() {
    nameTEXT.clear();
    nationalIdTEXT.clear();
  }

  @override
  dispose() {
    super.dispose();
    _isLoading = false;
  }
}
