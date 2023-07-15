import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rymc/common/app_constant/api_keys.dart';
import 'package:rymc/common/routes/routes.dart';
import 'package:rymc/common/services/navigation_services.dart';
import 'package:rymc/common/utils/fields.dart';

abstract class IFCMNotificationFirebase {
  requestPermission();
  Future<String?>? getFCMToken();
  initInfo();
  sendPushMessage({
    required String fcmToken,
    required String body,
    required String title,
    required Map<String, dynamic> data,
  });
}

class FCMNotificationFirebase implements IFCMNotificationFirebase {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final context = NavigationService.context;

  FCMNotificationFirebase() {
    requestPermission();
    initInfo();
  }

  @override
  requestPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      carPlay: false,
      badge: true,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log("User granted permission");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      log("User granted provisional permission");
    } else {
      log("User declined or has not accepted permission");
    }
  }

  @override
  Future<String?>? getFCMToken() async {
    return await _firebaseMessaging.getToken();
  }

  @override
  initInfo() async {
    final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');

    InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse details) async {
        try {
          if (details.payload != null) {
            print(details.payload!);

            context.pushNamed(RoutesStrings.splash);
          } else {
            context.pushNamed(RoutesStrings.splash);
          }
        } catch (e) {
          print(e);
        }
        return;
      },
    );

    /// firebase massaging
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      print("---------------on Messaging------------");
      print(
          "OnMessaging: ${message.notification!.title} \n${message.notification?.body}");
      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        message.notification!.body.toString(),
        htmlFormatBigText: true,
      );
      AndroidNotificationDetails androidNotificationDetails =
          AndroidNotificationDetails(
        Fields.fcmToken,
        Fields.fcmToken,
        styleInformation: bigTextStyleInformation,
        priority: Priority.high,
        playSound: true,
        sound: RawResourceAndroidNotificationSound('callcoming'),
        fullScreenIntent: true,
        enableLights: true,
        audioAttributesUsage: AudioAttributesUsage.voiceCommunication,
      );

      NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidNotificationDetails);
      await _flutterLocalNotificationsPlugin.show(
        0,
        message.notification!.title,
        message.notification!.body,
        platformChannelSpecifics,
        payload: message.data["data"],
      );
    });
  }

  @override
  sendPushMessage(
      {required String fcmToken,
      required String body,
      required String title,
      required Map<String, dynamic> data}) async {
    String url = "https://fcm.googleapis.com/fcm/send";
    print(url);
    try {
      await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=${ApiKeys.serverFCMKey}',
        },
        body: jsonEncode(
          <String, dynamic>{
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'status': 'done',
              'body': body,
              'title': title,
              'data': data,
            },
            'notification': <String, dynamic>{
              'title:': title,
              'body': body,
              'android_channel_id': Fields.fcmToken,
              'ios_channel_id': Fields.fcmToken,
            },
            'to': fcmToken,
          },
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print("error push notification");
      }
      print(e);
    }
  }
}
