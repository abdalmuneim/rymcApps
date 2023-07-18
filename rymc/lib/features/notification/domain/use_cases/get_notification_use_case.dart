import 'package:dartz/dartz.dart';
import 'package:rymc/common/handler/failure.dart';
import 'package:rymc/features/notification/domain/entities/notification_entities.dart';
import 'package:rymc/features/notification/domain/repositories/notification_repository.dart';

class GetNotificationUseCase {
  INotificationRepository iNotificationRepository;
  GetNotificationUseCase(this.iNotificationRepository);
  Future<Either<Failure, List<Notification>>> call({
    required String uid,
  }) async =>
      await iNotificationRepository.getNotifications(uid: uid);
}
