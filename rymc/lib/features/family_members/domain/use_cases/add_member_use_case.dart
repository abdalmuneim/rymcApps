import 'package:dartz/dartz.dart';
import 'package:rymc/common/handler/failure.dart';
import 'package:rymc/features/family_members/domain/repositories/member_repository.dart';

class AddMemberUseCase {
  final IMembersRepository iMembersRepository;

  AddMemberUseCase(this.iMembersRepository);
  Future<Either<Failure, Unit>> call({
    required String name,
    required String nationalId,
  }) async {
    return await iMembersRepository.addMember(
        name: name, nationalId: nationalId);
  }
}
