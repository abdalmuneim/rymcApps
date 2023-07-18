import 'package:dartz/dartz.dart';
import 'package:rymc/common/handler/failure.dart';
import 'package:rymc/features/notification/domain/entities/notification_entities.dart';

abstract class INotificationRepository {
  Future<Either<Failure, List<Notification>>> getNotifications();
  Future<Either<Failure, Unit>> addNotification({
    required String title,
    required String description,
    String? image,
    // required Map<dynamic, dynamic> data,
    required String getAt,
  });
}
