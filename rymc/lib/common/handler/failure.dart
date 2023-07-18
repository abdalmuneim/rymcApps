abstract class Failure {
  final String message;
  const Failure({required this.message});
}

class ServerFailure extends Failure {
  const ServerFailure({
    super.message = 'خطاء في السرفر',
  });
  List<Object?> get props => [];
}

class ConnectionFailure extends Failure {
  const ConnectionFailure({super.message = 'خطاء في الاتصال'});
  List<Object?> get props => [];
}

class UnAuthorizedFailure extends Failure {
  const UnAuthorizedFailure({
    super.message = "حسابك غير مسجل حاول تسجيل الدخول مرة اخرى.",
  });

  List<Object?> get props => [];
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({
    super.message = 'تعذر العثور علي البيانات',
  });

  List<Object?> get props => [];
}

class ExceptionFailure extends Failure {
  const ExceptionFailure({
    super.message = '',
  });

  List<Object?> get props => [];
}
