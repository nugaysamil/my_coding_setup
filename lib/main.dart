import 'package:flutter/material.dart';
import 'package:my_coding/feature/views/home_view.dart';

void main() {
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
