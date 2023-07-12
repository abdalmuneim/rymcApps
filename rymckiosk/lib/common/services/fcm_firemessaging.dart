import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rymckiosk/common/app_constant/api_keys.dart';
import 'package:rymckiosk/common/routes/pages.dart';
import 'package:rymckiosk/common/utils/fields.dart';
import 'package:rymckiosk/features/live_feature/presentations/controllers/live_controller.dart';

abstract class FCMNotificationFirebase {
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

class FCMNotificationFirebaseImpl implements FCMNotificationFirebase {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  FCMNotificationFirebaseImpl() {
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
      print("User granted permission");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("User granted provisional permission");
    } else {
      print("User declined or has not accepted permission");
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
            final json = jsonDecode(details.payload!);
            await Get.put(LiveController());
            Get.toNamed(Routes.live,
                arguments: {"doctor": json['doctor'], "user": json['user']});
          } else {
            Get.offAllNamed(Routes.initial);
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
        Fields.callComing,
        Fields.callComing,
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
              'android_channel_id': Fields.callComing,
              'ios_channel_id': Fields.callComing,
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
