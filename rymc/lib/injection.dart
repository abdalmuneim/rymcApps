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
import 'package:rymc/features/family_members/data/data_source/members_remote_data_source.dart';
import 'package:rymc/features/family_members/data/repositories/member_repository_impl.dart';
import 'package:rymc/features/family_members/domain/repositories/member_repository.dart';
import 'package:rymc/features/family_members/domain/use_cases/add_member_use_case.dart';
import 'package:rymc/features/family_members/domain/use_cases/edit_member_use_case.dart';
import 'package:rymc/features/family_members/domain/use_cases/get_members_use_case.dart';
import 'package:rymc/features/notification/data/data_source/remote_data_source/notification_remote_data_source.dart';
import 'package:rymc/features/notification/data/repositories/notification_repository_impl.dart';
import 'package:rymc/features/notification/domain/repositories/notification_repository.dart';
import 'package:rymc/features/notification/domain/use_cases/get_notification_use_case.dart';
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
  sl.registerLazySingleton<IMembersRemoteDataSource>(
      () => MembersRemoteDataSource());
  sl.registerLazySingleton<INotificationRemoteDataSource>(
      () => NotificationRemoteDataSource());

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
  sl.registerLazySingleton(() => AddMemberUseCase(sl()));
  sl.registerLazySingleton(() => EditMemberUseCase(sl()));
  sl.registerLazySingleton(() => GetMemberUseCase(sl()));
  sl.registerLazySingleton(() => GetNotificationUseCase(sl()));

  /// Repository
  sl.registerLazySingleton<IAuthRepository>(
      () => AuthRepository(localDataSource: sl(), remoteDataSource: sl()));
  sl.registerLazySingleton<IMembersRepository>(() =>
      MemberRepository(iMembersRemoteDataSource: sl(), localDataSource: sl()));
  sl.registerLazySingleton<INotificationRepository>(() =>
      NotificationRepository(
          iNotificationRemoteDataSource: sl(), localDataSource: sl()));

  //--------------- services--------------
  sl.registerLazySingleton<IFCMNotificationFirebase>(
      () => FCMNotificationFirebase());
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));
}
