import 'package:cloud_firestore/cloud_firestore.dart';
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
  runApp(Pulse());
}

class Pulse extends StatefulWidget {
  Pulse({super.key});

  @override
  State<Pulse> createState() => _PulseState();
}

class _PulseState extends State<Pulse> {
  List<Map<String, dynamic>> news = [];

  Future<List<Map<String, dynamic>>> getNews() async {
    FirebaseFirestore db = FirebaseFirestore.instance;
    CollectionReference<Map<String, dynamic>> collection = db.collection(
      "news",
    );
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await collection.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = querySnapshot.docs;
    for (var doc in docs) {
      Map<String, dynamic> data = doc.data();
      news.add(data);
    }
    setState(() {});
    return news;
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
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
