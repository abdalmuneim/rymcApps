import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:rymc/common/services/fcm_firemessaging.dart';
import 'package:rymc/common/services/network_services.dart';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:rymc/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:rymc/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:rymc/features/auth/data/repositories/auth_repositories_imp.dart';
import 'package:rymc/features/auth/domain/repositories/auth_repositories.dart';
import 'package:rymc/features/auth/domain/use_cases/get_current_user_use_case.dart';
import 'package:rymc/features/auth/domain/use_cases/is_logged_in_use_case.dart';
import 'package:rymc/features/auth/domain/use_cases/is_sign_in_before_use_case.dart';
import 'package:rymc/features/auth/domain/use_cases/log_out_use_case.dart';
import 'package:rymc/features/auth/domain/use_cases/register_use_case.dart';
import 'package:rymc/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:rymc/features/auth/domain/use_cases/verify_code_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final SharedPreferences sharedInstance =
      await SharedPreferences.getInstance();

  ///! External
  sl.registerLazySingleton(() => InternetConnectionCheckerPlus());
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton(() => sharedInstance);

  /// Data sources
  sl.registerLazySingleton<IAuthRemoteDataSource>(() => AuthRemoteDataSource());

  /// Local sources
  sl.registerLazySingleton<IAuthLocalDataSource>(() =>
      AuthLocalDataSource(flutterSecureStorage: sl(), sharedPreferences: sl()));

  /// Use cases
  sl.registerLazySingleton(() => GetCurrentUserUseCase(sl()));
  sl.registerLazySingleton(() => IsLoggedInUseCase(sl()));
  sl.registerLazySingleton(() => IsSignInBeforeUseCase(sl()));
  sl.registerLazySingleton(() => LogOutUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => VerifyCodeUseCase(sl()));

  /// Repository
  sl.registerLazySingleton<IAuthRepository>(
      () => AuthRepository(localDataSource: sl(), remoteDataSource: sl()));

  //--------------- services--------------
  sl.registerLazySingleton<IFCMNotificationFirebase>(
      () => FCMNotificationFirebase());
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));
}
