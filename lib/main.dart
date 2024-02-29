import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_coding/feature/views/home_form_view.dart';
import 'package:my_coding/feature/views/home_view.dart';
import 'package:my_coding/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Coding Setup',
      theme: ThemeData.dark(),
      home: const HomeView(),
    );
  }
}
