import 'package:get_it/get_it.dart';

import 'package:rymckiosk/common/services/fcm_firemessaging.dart';
import 'package:rymckiosk/common/services/network_service.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///-------------- Auth FEATURE -----------------------
  // Use cases

  // Repository

  // Data sources

  // Local sources

  //! External

  ///--------------- services--------------
  sl.registerLazySingleton<FCMNotificationFirebase>(
      () => FCMNotificationFirebaseImpl());
  // network
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(internetConnectionChecker: sl()),
  );
  sl.registerLazySingleton(() => InternetConnectionCheckerPlus());
}
