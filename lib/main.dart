import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pulse/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Pulse());
}

class Pulse extends StatelessWidget {
  const Pulse({super.key});

  Future<void> getNews() async {}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Scaffold());
  }
}
