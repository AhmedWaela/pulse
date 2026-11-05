import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pulse/firebase_options.dart';
import 'package:pulse/news_item.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView.builder(
          itemCount: news.length,
          itemBuilder: (context, index) {
            return NewsItem(
              image: news[index]['image'],
              title: news[index]['title'],
              description: news[index]['description'],
            );
          },
        ),
      ),
    );
  }
}
