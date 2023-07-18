import 'package:dartz/dartz.dart';
import 'package:rymc/common/handler/failure.dart';
import 'package:rymc/features/notification/domain/entities/notification_entities.dart';

abstract class INotificationRepository {
  Future<Either<Failure, List<Notification>>> getNotifications(
      {required String uid});
  Future<Either<Failure, Unit>> addNotification({
    required int id,
    required String title,
    required String description,
    required String image,
    required String data,
    required String getAt,
  });
}
