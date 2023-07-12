import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:rymckiosk/common/app_constant/app_constants.dart';
import 'package:rymckiosk/common/routes/pages.dart';
import 'package:rymckiosk/firebase_option.dart';
import 'package:rymckiosk/generated/l10n.dart';
import 'package:sizer/sizer.dart';
import 'package:rymckiosk/injection.dart' as di;

import 'common/resources/theme_manager.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Message id: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
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
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return GetMaterialApp(
          theme: applicationTheme,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          fallbackLocale: Locale(AppConstants.languages[0].languageCode,
              AppConstants.languages[0].countryCode),
          locale: Get.deviceLocale,
          supportedLocales: S.delegate.supportedLocales,
          initialRoute: Routes.initial,
          getPages: AppPages.pages,
          // debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
