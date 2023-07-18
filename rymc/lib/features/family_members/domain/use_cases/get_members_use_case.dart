import 'package:dartz/dartz.dart';
import 'package:rymc/common/handler/failure.dart';
import 'package:rymc/features/auth/domain/entities/user.dart';
import 'package:rymc/features/family_members/domain/repositories/member_repository.dart';

class GetMemberUseCase {
  final IMembersRepository iMembersRepository;

  GetMemberUseCase(this.iMembersRepository);
  Future<Either<Failure, List<User>>> call() async {
    return await iMembersRepository.getMembers();
  }
}
