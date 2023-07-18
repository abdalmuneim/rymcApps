import 'package:dartz/dartz.dart';
import 'package:rymc/common/handler/failure.dart';
import 'package:rymc/features/family_members/domain/repositories/member_repository.dart';

class EditMemberUseCase {
  final IMembersRepository iMembersRepository;

  EditMemberUseCase(this.iMembersRepository);
  Future<Either<Failure, Unit>> call({
    required String name,
    required String nationalId,
  }) async {
    return await iMembersRepository.editMember(
        name: name, nationalId: nationalId);
  }
}
