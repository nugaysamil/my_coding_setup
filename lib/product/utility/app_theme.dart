import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_coding/product/generation/colors.gen.dart';

final class AppTheme {
  AppTheme() {
    _themeData = ThemeData.dark();
  }
  late final ThemeData _themeData;
  ThemeData get currentTheme => _themeData.copyWith(
        scaffoldBackgroundColor: ColorName.cynicalBlack,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        colorScheme: const ColorScheme.dark(
          onSecondary: Colors.white,
        ),
      );
}
