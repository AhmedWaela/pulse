import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:pulse/local_notification.dart';

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

  static Future<String?> getDeviceToken() async {
    String? token = await _messaging.getToken();
    return token;
  }

  static Future<void> init() async {
    FirebaseMessaging.onMessage.listen((event) {
      LocalNotification.sendNotification(
        event.notification.hashCode,
        event.notification?.title,
        event.notification?.body,
      );
    });
  }
}
