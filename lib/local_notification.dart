import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotification {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> init() async {
    await _plugin.initialize(
      settings: InitializationSettings(
        android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      ),
      onDidReceiveBackgroundNotificationResponse:
          _onDidReceiveBackgroundNotificationResponse,
      onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
    );
  }

  static void _onDidReceiveNotificationResponse(NotificationResponse details) {}

  static void _onDidReceiveBackgroundNotificationResponse(
    NotificationResponse details,
  ) {}

  static Future<void> sendNotification(
    int id,
    String? title,
    String? body,
  ) async {
    await _plugin.show(
      id: id,
      title: title,
      body: body,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          "news_id",
          "news",
          importance: Importance.max,
          priority: Priority.max,
        ),
      ),
    );
  }
}
