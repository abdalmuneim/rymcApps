import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rymc/common/resources/app_color.dart';
import 'package:rymc/common/utils/extension.dart';
import 'package:rymc/common/widgets/custom_text.dart';
import 'package:rymc/features/notification/presentations/providers/notification_provider.dart';
import 'package:rymc/generated/l10n.dart';
import 'package:sizer/sizer.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  late NotificationProvider read = context.read<NotificationProvider>();
  late NotificationProvider watch = context.watch<NotificationProvider>();

  @override
  void initState() {
    super.initState();
    read.getNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          title: const Text('الاشعارات'),
        ),
      ),
      body: watch.notifications.isEmpty
          ? Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.notifications_active_outlined,
                  color: Colors.grey.withOpacity(.5),
                  size: 10.h,
                ),
                3.h.sh,
                CustomText(
                  text: S.of(context).noNotificationYet,
                  color: Colors.grey.withOpacity(.5),
                  fontSize: 20.sp,
                ),
              ],
            ))
          : ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                final notification = watch.notifications[index];
                return Card(
                  color: AppColors.white,
                  child: ListTile(
                    title: Text(notification.title ?? ""),
                    subtitle: Text(notification.description ?? ""),
                    leading: Text(notification.id.toString()),
                    trailing: Text(notification.getAt ?? ""),
                  ),
                );
              },
            ),
    );
  }
}
