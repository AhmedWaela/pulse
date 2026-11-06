import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart';
import 'package:pulse/local_notification.dart';
import 'package:pulse/server_key.dart';

class PushNotification {
  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

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
    String? token;
    _messaging.onRegistered.listen((event) {
      token = event;
    });
    await _messaging.register();
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

  static Future<void> sendPushNotification(
    String token,
    String title,
    String body,
  ) async {
    final serverKey = await ServerKey.getServerKey();
    final url =
        'https://fcm.googleapis.com/v1/projects/pulse-9a153/messages:send';
    var headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $serverKey",
    };

    var message = {
      "message": {
        "token": token,
        "notification": {"title": title, "body": body},
      },
    };

    var response = await post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(message),
    );
  }
}
