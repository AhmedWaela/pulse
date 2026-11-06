import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:pulse/firebase_options.dart';
import 'package:pulse/local_notification.dart';
import 'package:pulse/news_details.dart';
import 'package:pulse/news_model.dart';
import 'package:pulse/news_view.dart';
import 'package:pulse/push_notification.dart';

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

      theme: ThemeData(scaffoldBackgroundColor: Colors.white),

      home: const NewsView(),

      onGenerateRoute: (settings) {
        final uri = Uri.parse(settings.name ?? '');

        if (uri.pathSegments.length >= 2 && uri.pathSegments[0] == 'news') {
          final newsId = uri.pathSegments[1];

          return MaterialPageRoute(
            builder: (context) {
              return FutureBuilder(
                future: FirebaseFirestore.instance
                    .collection('news')
                    .doc(newsId)
                    .get(),

                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Scaffold(
                      body: Center(child: CircularProgressIndicator()),
                    );
                  }

                  if (!snapshot.hasData || !snapshot.data!.exists) {
                    return const Scaffold(
                      body: Center(child: Text('News not found')),
                    );
                  }

                  final news = NewsModel.fromJson(
                    snapshot.data!.data()!,
                    newsId,
                  );

                  return NewsDetails(news: news);
                },
              );
            },
          );
        }

        return null;
      },
    );
  }
}
