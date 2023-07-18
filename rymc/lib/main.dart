import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:rymc/common/app_constant/providers.dart';
import 'package:rymc/common/resources/theme_manager.dart';
import 'package:rymc/common/routes/routes.dart';
import 'package:rymc/common/utils/fields.dart';
import 'package:rymc/features/notification/data/data_source/firebase_collections/notification_collection.dart';
import 'package:rymc/features/notification/data/model/notification_model.dart';
import 'package:rymc/firebase_option.dart';
import 'package:rymc/generated/l10n.dart';
import 'package:sizer/sizer.dart';
import 'package:rymc/injection.dart' as di;

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log("Message id: ${message.messageId}");

  final String? uid = await FlutterSecureStorage().read(key: StoredKeys.uid);
  log(uid ?? "null");
  if (uid != null) {
    await NotificationCollection.instance.addNotification(
        notification: NotificationModel(
            title: message.notification?.title,
            description: message.notification?.body),
        uid: uid);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'rymc',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Sizer(
        builder: (BuildContext context, Orientation orientation,
            DeviceType deviceType) {
          return MultiProvider(
            providers: Providers.providers,
            child: Builder(
              builder: (context) {
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  routerConfig: Routes.router,
                  theme: applicationTheme,
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  locale: const Locale("ar"),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
