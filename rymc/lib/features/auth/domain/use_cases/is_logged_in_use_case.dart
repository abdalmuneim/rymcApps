import 'package:rymc/features/auth/domain/repositories/auth_repositories.dart';

class IsLoggedInUseCase {
  final IAuthRepository repository;

  IsLoggedInUseCase(this.repository);

  Future<bool> call() async {
    return await repository.isLoggedIn();
  }
}
