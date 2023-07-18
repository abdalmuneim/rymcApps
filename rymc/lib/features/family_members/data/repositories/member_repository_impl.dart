import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:rymc/common/handler/exception.dart';
import 'package:rymc/common/handler/failure.dart';
import 'package:rymc/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:rymc/features/auth/data/model/user_model.dart';
import 'package:rymc/features/family_members/data/data_source/members_remote_data_source.dart';
import 'package:rymc/features/family_members/domain/repositories/member_repository.dart';

class MemberRepository implements IMembersRepository {
  IMembersRemoteDataSource iMembersRemoteDataSource;
  final IAuthLocalDataSource localDataSource;

  MemberRepository({
    required this.iMembersRemoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<UserModel>>> getMembers() async {
    try {
      final String? uid = await localDataSource.readToken();
      if (uid != null) {
        final List<UserModel> data =
            await iMembersRemoteDataSource.getMembers(uid: uid);
        return Right(data);
      } else {
        return Left(UnAuthorizedFailure());
      }
    } on DataBaseException {
      return Left(DatabaseFailure());
    } catch (e) {
      print(e);
      return Left(ExceptionFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addMember({
    required String name,
    required String nationalId,
  }) async {
    try {
      final String? uid = await localDataSource.readToken();
      if (uid != null) {
        await iMembersRemoteDataSource.addMember(
          name: name,
          uid: uid,
          nationalId: nationalId,
          addAt: DateFormat('hh:mm dd-MM-yyyy').format(
            DateTime.now(),
          ),
        );
        return Right(unit);
      }
      return Left(UnAuthorizedFailure());
    } catch (e) {
      print(e);
      return Left(ExceptionFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> editMember({
    required String name,
    required String nationalId,
  }) async {
    try {
      final String? uid = await localDataSource.readToken();
      if (uid != null) {
        await iMembersRemoteDataSource.editMember(
          name: name,
          uid: uid,
          nationalId: nationalId,
          addAt: DateFormat('hh:mm dd-MM-yyyy').format(
            DateTime.now(),
          ),
        );
        return Right(unit);
      }
      return Left(UnAuthorizedFailure());
    } catch (e) {
      print(e);
      return Left(ExceptionFailure(message: e.toString()));
    }
  }
}
