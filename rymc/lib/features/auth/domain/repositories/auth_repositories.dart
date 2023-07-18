import 'package:dartz/dartz.dart';
import 'package:rymc/common/handler/failure.dart';
import 'package:rymc/features/auth/domain/entities/user.dart';

abstract class IAuthRepository {
  Future<Either<Failure, User?>> isSignInBefore();
  Future<Either<Failure, User?>> getCurrentUser();

  Future<Either<Failure, bool>> signIn({
    required String phone,
  });
  Future<Either<Failure, String>> resendOTP();

  Future<Either<Failure, bool>> register({
    required String name,
    required String nationalId,
    required String fcm,
  });
  Future<Either<Failure, bool>> verifyCode({required String sms});
  Future<bool> isLoggedIn();
  Future<Either<Failure, Unit>> logOut();
}
