import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:rymc/common/handler/exception.dart';
import 'package:rymc/common/handler/failure.dart';
import 'package:rymc/features/auth/data/data_source/auth_local_data_source.dart';
import 'package:rymc/features/notification/data/data_source/remote_data_source/notification_remote_data_source.dart';
import 'package:rymc/features/notification/data/model/notification_model.dart';
import 'package:rymc/features/notification/domain/repositories/notification_repository.dart';

class NotificationRepository implements INotificationRepository {
  INotificationRemoteDataSource iNotificationRemoteDataSource;
  IAuthLocalDataSource localDataSource;
  NotificationRepository({
    required this.iNotificationRemoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<NotificationModel>>> getNotifications() async {
    try {
      final String? uid = await localDataSource.readToken();
      if (uid != null) {
        final List<NotificationModel> data =
            await iNotificationRemoteDataSource.getNotifications(uid: uid);
        return Right(data);
      } else {
        return Left(UnAuthorizedFailure());
      }
    } on DataBaseException {
      return Left(DatabaseFailure());
    } catch (e) {
      print(e);
      return Left(ExceptionFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addNotification({
    required String title,
    required String description,
    String? image,
    // required Map<dynamic, dynamic> data,
    required String getAt,
  }) async {
    try {
      final String? uid = await localDataSource.readToken();
      if (uid != null) {
        await iNotificationRemoteDataSource
            .getNotifications(uid: uid)
            .then((List<NotificationModel> value) async {
          log("${value.length}");
          await iNotificationRemoteDataSource.addNotification(
            id: value.length + 1,
            title: title,
            description: description,
            image: image,
            // data: data,
            getAt: DateTime.now().toIso8601String(),
            uid: uid,
          );
        });

        return Right(unit);
      }
      return Left(UnAuthorizedFailure());
    } catch (e) {
      print(e);
      return Left(ExceptionFailure(message: e.toString()));
    }
  }
}
