import 'dart:io';
import 'dart:math';

import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void initLoaclNotification(
      BuildContext context, RemoteMessage message) async {
    var androidInitilizationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitilizationSettings = DarwinInitializationSettings();

    var initializationSetting = InitializationSettings(
        android: androidInitilizationSettings, iOS: iosInitilizationSettings);

    await _flutterLocalNotificationsPlugin.initialize(initializationSetting,
        onDidReceiveNotificationResponse: (payload) {});
  }

  void requestNotificationPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("User permission Grant");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("User permission provisional Grant");
    } else {
      AppSettings.openAppSettings();
      print("User denied permission");
    }
  }

  void firebaseInit(BuildContext context) {
    FirebaseMessaging.onMessage.listen((message) {

      if (Platform.isAndroid) {
        initLoaclNotification(context, message);
        showNotifications(message);
      }
    });
  } 

  Future<String?> getDeviceToken() async {
    String? token = await messaging.getToken();
    return token;
  }

  Future<void> showNotifications(RemoteMessage message) async {
    AndroidNotificationChannel channel = AndroidNotificationChannel(
        Random.secure().nextInt(100000).toString(), "Dairyculator",
        importance: Importance.max);

    AndroidNotificationDetails androidnotifiactionDetails =
        AndroidNotificationDetails(
            channel.id.toString(), channel.name.toString(),
            channelDescription: "Your Channel Discription",
            importance: Importance.high,
            priority: Priority.high,
            ticker: 'Ticker');

    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    NotificationDetails notificationDetails = NotificationDetails(
        android: androidnotifiactionDetails, iOS: darwinNotificationDetails);

    Future.delayed(Duration.zero, () {
      _flutterLocalNotificationsPlugin.show(
          0,
          message.notification?.title.toString(),
          message.notification?.body.toString(),
          notificationDetails);
    });
  }

  void isRefreshToken() async {
    messaging.onTokenRefresh.listen((event) {
      event.toString();
      print("refresh");
    });
  }
}
