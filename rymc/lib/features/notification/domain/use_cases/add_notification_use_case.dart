import 'package:dartz/dartz.dart';
import 'package:rymc/common/handler/failure.dart';
import 'package:rymc/features/notification/domain/repositories/notification_repository.dart';

class AddNotificationUseCase {
  INotificationRepository iNotificationRepository;
  AddNotificationUseCase(this.iNotificationRepository);
  Future<Either<Failure, Unit>> call({
    required int id,
    required String title,
    required String description,
    required String image,
    required String data,
    required String getAt,
  }) async =>
      await iNotificationRepository.addNotification(
          id: id,
          title: title,
          description: description,
          image: image,
          data: data,
          getAt: getAt);
}
