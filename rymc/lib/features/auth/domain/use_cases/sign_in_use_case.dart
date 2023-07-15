import 'package:dartz/dartz.dart';
import 'package:rymc/common/handler/failure.dart';
import 'package:rymc/features/auth/domain/repositories/auth_repositories.dart';

class SignInUseCase {
  final IAuthRepository repository;

  SignInUseCase(this.repository);

  Future<Either<Failure, bool>> call({required String phone}) async {
    return await repository.signIn(phone: phone);
  }
}
