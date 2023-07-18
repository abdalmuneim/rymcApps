import 'dart:io';

import 'package:rymc/common/handler/exception.dart';
import 'package:rymc/common/services/server_service.dart';
import 'package:rymc/features/auth/data/model/user_model.dart';
import 'package:rymc/features/family_members/data/firebase_collections/member_collections.dart';

abstract class IMembersRemoteDataSource {
  Future<List<UserModel>> getMembers({required String uid});
  Future<void> addMember({
    required String name,
    required String nationalId,
    required String uid,
    required String addAt,
  });
  Future<void> editMember({
    required String name,
    required String nationalId,
    required String uid,
    required String addAt,
  });
}

class MembersRemoteDataSource implements IMembersRemoteDataSource {
  @override
  Future<List<UserModel>> getMembers({required String uid}) async {
    try {
      return await MemberCollection().getMembers(uid: uid);
    } on SocketException {
      return ServerService<List<UserModel>>().timeOutMethod(
        () => getMembers(uid: uid),
      );
    } catch (e) {
      print(e);
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> addMember({
    required String name,
    required String nationalId,
    required String uid,
    required String addAt,
  }) async {
    try {
      UserModel user =
          UserModel(name: name, nationalId: nationalId, createAt: addAt);
      return await MemberCollection().addMember(uid: uid, user: user);
    } on SocketException {
      ServerService<void>().timeOutMethod(
        () => addMember(
            name: name, nationalId: nationalId, uid: uid, addAt: addAt),
      );
    } catch (e) {
      print(e);
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> editMember({
    required String name,
    required String nationalId,
    required String uid,
    required String addAt,
  }) async {
    try {
      UserModel user =
          UserModel(name: name, nationalId: nationalId, createAt: addAt);

      return await MemberCollection().editMember(user: user, uid: uid);
    } on SocketException {
      ServerService<void>().timeOutMethod(
        () => editMember(
          name: name,
          addAt: addAt,
          uid: uid,
          nationalId: nationalId,
        ),
      );
    } catch (e) {
      print(e);
      throw ServerException(
        message: e.toString(),
      );
    }
  }
}
