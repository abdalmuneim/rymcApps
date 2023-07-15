import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:rymc/common/handler/exception.dart';
import 'package:rymc/common/handler/failure.dart';
import 'package:rymc/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:rymc/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:rymc/features/auth/data/model/user_model.dart';
import 'package:rymc/features/auth/domain/entities/user.dart';
import 'package:rymc/features/auth/domain/repositories/auth_repositories.dart';

class AuthRepository implements IAuthRepository {
  final IAuthLocalDataSource localDataSource;
  final IAuthRemoteDataSource remoteDataSource;
  AuthRepository({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, UserModel?>> isSignInBefore() async {
    try {
      final String? uid = await localDataSource.readToken();
      if (uid == null) {
        return Left(DatabaseFailure());
      }
      final UserModel? user = await remoteDataSource.isSignInBefore(uid: uid);
      if (user != null) {
        await localDataSource.writeUser(user: user);
        return Right(user);
      }
      return Right(null);
    } on DataBaseException {
      return const Left(DatabaseFailure());
    } catch (e) {
      return Left(ExceptionFailure(message: e.toString()));
    }
  }

  @override
  Future<bool> isLoggedIn() => localDataSource.isLoggedIn();

  @override
  Future<Either<Failure, Unit>> logOut() async {
    try {
      await remoteDataSource.logOut();
      await localDataSource.removeToken();
      await localDataSource.removeUser();
      await localDataSource.readPhone();
      return Right(unit);
    } catch (e) {
      return Left(UnAuthorizedFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> register({
    required String name,
    required String nationalId,
    required String fcm,
  }) async {
    try {
      final String? uid = await localDataSource.readToken();
      if (uid == null) {
        return Left(DatabaseFailure());
      }
      final String phone = await localDataSource.readPhone();
      final UserModel user = UserModel(
        name: name,
        nationalId: nationalId,
        fcm: fcm,
        phone: phone,
        uid: uid,
        createAt: DateFormat('hh:mm dd-MM-yyyy').format(
          DateTime.now(),
        ),
      );
      await remoteDataSource.register(user: user);
      await localDataSource.writeUser(user: user);
      return Right(true);
    } on DataBaseException {
      return const Left(DatabaseFailure());
    } catch (e) {
      return Left(
        ExceptionFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> signIn({required String phone}) async {
    try {
      // await remoteDataSource.signIn(phone: phone);
      await localDataSource.writerPhone(phone: phone);
      return Right(true);
    } on DataBaseException {
      return const Left(DatabaseFailure());
    } catch (e) {
      return Left(ExceptionFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> verifyCode({required String sms}) async {
    try {
      // final uid = await remoteDataSource.verifyCode(sms: sms);
      await localDataSource.writeToken(token: sms);
      return Right(true);
    } on DataBaseException {
      return const Left(DatabaseFailure());
    } catch (e) {
      return Left(ExceptionFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, User?>> getCurrentUser() async {
    try {
      if (await localDataSource.isLoggedIn()) {
        UserModel? user = await localDataSource.readUser();
        return Right(user);
      } else {
        throw UnAuthorizedException();
      }
    } on UnAuthorizedException {
      return const Left(UnAuthorizedFailure());
    } on DataBaseException {
      return const Left(DatabaseFailure());
    } catch (error) {
      return Left(ExceptionFailure(message: error.toString()));
    }
  }
}
