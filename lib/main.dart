import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_coding/feature/views/authentication/welcome_view.dart';
import 'package:my_coding/feature/views/home/home_form_view.dart';
import 'package:my_coding/feature/views/home/home_view.dart';
import 'package:my_coding/firebase_options.dart';
import 'package:my_coding/product/generation/colors.gen.dart';
import 'package:my_coding/product/utility/app_theme.dart';

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
      theme: AppTheme().currentTheme,
      home: const WelcomeView(),
    );
  }
}
