import 'package:dartz/dartz.dart';
import 'package:rymc/common/handler/failure.dart';
import 'package:rymc/features/auth/domain/repositories/auth_repositories.dart';

class ResendOTPUseCase {
  final IAuthRepository repository;

  ResendOTPUseCase(this.repository);

  Future<Either<Failure, String>> call() async {
    return await repository.resendOTP();
  }
}
