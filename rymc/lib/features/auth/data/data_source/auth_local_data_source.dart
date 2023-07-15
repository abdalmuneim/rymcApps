import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rymc/common/handler/failure.dart';
import 'package:rymc/common/utils/fields.dart';
import 'package:rymc/features/auth/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IAuthLocalDataSource {
  Future<Unit> writerPhone({required String phone});
  Future<String> readPhone();
  Future<Unit> removePhone();

  Future<Unit> writeUser({required UserModel user});
  Future<UserModel?> readUser();
  Future<Unit> removeUser();

  Future<bool> isLoggedIn();

  Future<String?> readToken();
  Future<Unit> writeToken({required String? token});
  Future<Unit> removeToken();
}

class AuthLocalDataSource implements IAuthLocalDataSource {
  final FlutterSecureStorage flutterSecureStorage;
  final SharedPreferences sharedPreferences;

  AuthLocalDataSource({
    required this.flutterSecureStorage,
    required this.sharedPreferences,
  });

  @override
  Future<UserModel?> readUser() async {
    final String? data =
        await sharedPreferences.getString(StoredKeys.currentUser);
    if (data != null) {
      return UserModel.fromJson(data);
    } else {
      return null;
    }
  }

  @override
  Future<Unit> removeUser() async {
    await sharedPreferences.remove(StoredKeys.currentUser);

    return Future.value(unit);
  }

  @override
  Future<Unit> writeUser({required UserModel user}) async {
    try {
      await sharedPreferences.setString(StoredKeys.currentUser, user.toJson());
      if (user.uid != null) {
        await flutterSecureStorage.write(key: StoredKeys.uid, value: user.uid);
      }
      return unit;
    } catch (e) {
      throw DatabaseFailure();
    }
  }

  @override
  Future<Unit> removeToken() async {
    await flutterSecureStorage.delete(key: StoredKeys.uid);

    return Future.value(unit);
  }

  @override
  Future<Unit> writeToken({required String? token}) async {
    try {
      await flutterSecureStorage.write(key: StoredKeys.uid, value: token);
      return Future.value(unit);
    } catch (e) {
      throw DatabaseFailure();
    }
  }

  @override
  Future<String?> readToken() async {
    try {
      final data = await flutterSecureStorage.read(key: StoredKeys.uid);

      return Future.value(data);
    } catch (e) {
      throw UnAuthorizedFailure();
    }
  }

  @override
  Future<String> readPhone() async {
    try {
      final data = await sharedPreferences.getString(StoredKeys.phone);

      return Future.value(data);
    } catch (e) {
      throw DatabaseFailure();
    }
  }

  @override
  Future<Unit> writerPhone({required String phone}) async {
    try {
      await sharedPreferences.setString(StoredKeys.phone, phone);
      return Future.value(unit);
    } catch (e) {
      throw DatabaseFailure();
    }
  }

  @override
  Future<bool> isLoggedIn() async =>
      await readToken() != null && await readUser() != null;

  @override
  Future<Unit> removePhone() async {
    await sharedPreferences.remove(StoredKeys.phone);

    return Future.value(unit);
  }
}
