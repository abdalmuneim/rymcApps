import 'package:dartz/dartz.dart';
import 'package:rymc/common/handler/failure.dart';
import 'package:rymc/features/notification/domain/repositories/notification_repository.dart';

class AddNotificationUseCase {
  INotificationRepository iNotificationRepository;
  AddNotificationUseCase(this.iNotificationRepository);
  Future<Either<Failure, Unit>> call({
    required String title,
    required String description,
    String? image,
    // required Map<dynamic, dynamic> data,
    required String getAt,
  }) async =>
      await iNotificationRepository.addNotification(
          title: title,
          description: description,
          image: image,
          // data: data,
          getAt: getAt);
}
