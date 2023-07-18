import 'package:flutter/material.dart' hide Notification;
import 'package:go_router/go_router.dart';
import 'package:rymc/common/handler/exception.dart';
import 'package:rymc/common/routes/routes.dart';
import 'package:rymc/common/services/navigation_services.dart';
import 'package:rymc/common/utils/utils.dart';
import 'package:rymc/features/notification/domain/entities/notification_entities.dart';
import 'package:rymc/features/notification/domain/use_cases/get_notification_use_case.dart';

class NotificationProvider extends ChangeNotifier {
  GetNotificationUseCase _getNotificationUseCase;
  NotificationProvider(this._getNotificationUseCase);
  final BuildContext _context = NavigationService.context;

  List<Notification> _notifications = [];
  List<Notification> get notifications => _notifications;

  getNotifications() async {
    final result = await _getNotificationUseCase();
    result.fold((l) {
      if (l.runtimeType == UnAuthorizedException) {
        _context.pushReplacementNamed(RoutesStrings.login);
      } else {
        Utils.showError(l.message);
      }
    }, (r) {
      _notifications = r;
      notifyListeners();
    });
  }
}
