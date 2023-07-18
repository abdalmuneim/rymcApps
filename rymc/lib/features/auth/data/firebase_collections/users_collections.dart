import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rymc/common/utils/fields.dart';
import 'package:rymc/features/auth/data/model/user_model.dart';

class UsersCollection {
  static UsersCollection _init = UsersCollection();
  static UsersCollection instance = _init;

  final CollectionReference _userCollectionReference =
      FirebaseFirestore.instance.collection(Collections.users);

  Future<void> addUser(UserModel user) async => await _userCollectionReference
      .doc(user.uid)
      .collection(Collections.usersData)
      .doc(Collections.usersData)
      .set(user.toMap());

  Future<void> updateUser(UserModel user) async =>
      await _userCollectionReference
          .doc(user.uid)
          .collection(Collections.usersData)
          .doc(Collections.usersData)
          .update(user.toMap());

  Future<UserModel?> getUser({required String uid}) async {
    final DocumentSnapshot<Object?> data = await _userCollectionReference
        .doc(uid)
        .collection(Collections.usersData)
        .doc(Collections.usersData)
        .get();
    final d = data.data() as Map<String, dynamic>;

    return UserModel.fromMap(d);
  }
}
