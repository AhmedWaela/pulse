import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotification {
  static FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static Future<void> requestNotificationPermission() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("user granted permission");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('user provisional granted permission');
    } else {
      print("user denied permision");
    }
  }
}
