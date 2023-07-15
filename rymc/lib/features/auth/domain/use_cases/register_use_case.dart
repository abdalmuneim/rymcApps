import 'package:dartz/dartz.dart';
import 'package:rymc/common/handler/failure.dart';
import 'package:rymc/features/auth/domain/repositories/auth_repositories.dart';

class RegisterUseCase {
  final IAuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<Failure, bool>> call({
    required String name,
    required String nationalId,
    required String fcm,
  }) async {
    return await repository.register(
      name: name,
      nationalId: nationalId,
      fcm: fcm,
    );
  }
}
