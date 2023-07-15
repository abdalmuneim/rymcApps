import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rymc/common/services/navigation_services.dart';
import 'package:rymc/common/utils/utils.dart';
import 'package:rymc/features/auth/data/model/user_model.dart';
import 'package:rymc/features/family_members/presentations/providers/family_members_provider.dart';
import 'package:rymc/generated/l10n.dart';

class AddMemberProvider extends ChangeNotifier {
  final BuildContext _context = NavigationService.context;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> get globalKey => _globalKey;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final nameTEXT = TextEditingController();
  final nationalIdTEXT = TextEditingController();

  addMemberToFamily() {
    _isLoading = true;
    notifyListeners();
    if (_globalKey.currentState!.validate()) {
      final bool check =
          Provider.of<FamilyMembersProvider>(_context, listen: false)
              .families
              .any((element) => element.nationalId == nameTEXT.text);
      if (check) {
        Utils.showError(
          S.of(_context).memberIsAlreadyExists(nationalIdTEXT.text),
        );
      } else {
        Provider.of<FamilyMembersProvider>(_context, listen: false)
            .families
            .add(
              UserModel(
                
                name: nameTEXT.text,
                nationalId: nationalIdTEXT.text,
              ),
            );
        _isLoading = false;
        notifyListeners();
        _context.pop(true);
        clearFields();
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
