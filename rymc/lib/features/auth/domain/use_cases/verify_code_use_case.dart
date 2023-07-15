import 'package:dartz/dartz.dart';
import 'package:rymc/common/handler/failure.dart';
import 'package:rymc/features/auth/domain/repositories/auth_repositories.dart';

class VerifyCodeUseCase {
  final IAuthRepository repository;

  VerifyCodeUseCase(this.repository);

  Future<Either<Failure, bool>> call({required String sms}) async {
    return await repository.verifyCode(sms: sms);
  }
}
