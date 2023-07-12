import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rymc/common/services/navigation_services.dart';
import 'package:rymc/features/auth/data/models/user_model.dart';
import 'package:rymc/features/family_members/presentations/providers/family_members_provider.dart';

class EditMemberProvider extends ChangeNotifier {
  final BuildContext _context = NavigationService.context;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  GlobalKey<FormState> get globalKey => _globalKey;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  final nameTEXT = TextEditingController();
  final nationalIdTEXT = TextEditingController();
  late int id;

  editMemberToFamily() {
    _isLoading = true;
    notifyListeners();
    if (_globalKey.currentState!.validate()) {
      Provider.of<FamilyMembersProvider>(_context, listen: false).families[
          Provider.of<FamilyMembersProvider>(_context, listen: false)
              .families
              .indexWhere((element) => element.id == id)] = UserModel(
        id: id,
        name: nameTEXT.text,
        nationalId: nationalIdTEXT.text,
      );
      _context.pop(true);
      _isLoading = false;
      notifyListeners();
    }
  }

  removeMemberFromFamily(UserModel member) {
    _isLoading = true;
    notifyListeners();
    Provider.of<FamilyMembersProvider>(_context, listen: false)
        .families
        .removeWhere((element) => element.nationalId == member.nationalId);
    _isLoading = false;
    notifyListeners();
    _context.pop(true);
  }
}
