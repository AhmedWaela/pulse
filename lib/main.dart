import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pulse/firebase_options.dart';
import 'package:pulse/local_notification.dart';
import 'package:pulse/push_notification.dart';
import 'package:pulse/server_key.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await LocalNotification.init();
  await PushNotification.init();
  runApp(const Pulse());
}

class Pulse extends StatelessWidget {
  const Pulse({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final token = await PushNotification.getDeviceToken();
            await PushNotification.sendPushNotification(
              token ?? "",
              "Hello",
              "Mohammed",
            );
          },
        ),
      ),
    );
  }
}
