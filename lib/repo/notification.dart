import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationServices {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

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

    if(settings.authorizationStatus == AuthorizationStatus.authorized){
            print("User permission Grant");
    }else if(settings.authorizationStatus == AuthorizationStatus.provisional){
            print("User permission provisional Grant");

    }else{
      AppSettings.openAppSettings();
      print("User denied permission");
    }
  }
}
