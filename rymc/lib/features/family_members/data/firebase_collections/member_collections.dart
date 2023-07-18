import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rymc/common/utils/fields.dart';
import 'package:rymc/features/auth/data/model/user_model.dart';

class MemberCollection {
  static MemberCollection _init = MemberCollection();
  static MemberCollection instance = _init;

  final CollectionReference _userMembersCollectionReference =
      FirebaseFirestore.instance.collection(Collections.users);

  Future<void> addMember(
          {required UserModel user, required String uid}) async =>
      await _userMembersCollectionReference
          .doc(uid)
          .collection(Collections.userMembers)
          .doc(user.nationalId)
          .set(user.toMap());

  Future<void> editMember(
          {required UserModel user, required String uid}) async =>
      await _userMembersCollectionReference
          .doc(uid)
          .collection(Collections.userMembers)
          .doc(user.nationalId)
          .update(user.toMap());

  Future<List<UserModel>> getMembers({required String uid}) async {
    final data = await _userMembersCollectionReference
        .doc(uid)
        .collection(Collections.userMembers)
        .snapshots();
    List<UserModel> member = [];
    await for (var e in data) {
      for (var data in e.docs) {
        member.add(UserModel.fromMap(data.data()));
      }
      return member;
    }
    return member;
  }
}
