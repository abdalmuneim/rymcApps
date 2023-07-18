import 'package:dartz/dartz.dart';
import 'package:rymc/common/handler/failure.dart';
import 'package:rymc/features/auth/domain/entities/user.dart';

abstract class IMembersRepository {
  Future<Either<Failure, List<User>>> getMembers();
  Future<Either<Failure, Unit>> addMember({
    required String name,
    required String nationalId,
  });
  Future<Either<Failure, Unit>> editMember({
    required String name,
    required String nationalId,
  });
}
