import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pulse/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(Pulse());
}

class Pulse extends StatelessWidget {
  Pulse({super.key});

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
    return news;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Scaffold());
  }
}
