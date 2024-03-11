import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_coding/feature/views/authentication/welcome_view.dart';
import 'package:my_coding/firebase_options.dart';
import 'package:my_coding/product/utility/translation/translation_manager.dart';
import 'package:my_coding/product/utility/app_theme.dart';
import 'package:my_coding/product/utility/ui_general/system_style.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemGeneralStyle.make();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(TranslationManager(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Coding Setup',
      theme: AppTheme().currentTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home:  WelcomeView(),
    );
  }
}
