import 'package:dartz/dartz.dart';
import 'package:rymc/common/handler/failure.dart';
import 'package:rymc/features/auth/domain/entities/user.dart';
import 'package:rymc/features/auth/domain/repositories/auth_repositories.dart';

class IsSignInBeforeUseCase {
  final IAuthRepository repository;

  IsSignInBeforeUseCase(this.repository);

  Future<Either<Failure, User?>> call() async {
    return await repository.isSignInBefore();
  }
}
