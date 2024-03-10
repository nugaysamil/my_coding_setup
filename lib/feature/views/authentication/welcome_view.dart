import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:my_coding/product/generation/assets.gen.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Assets.images.imgCodeWelcome.image(),
          Text(
            'Code Setup',
            style: context.general.textTheme.headlineLarge?.copyWith(),
          ),
          Text(
            'Set up your coding environment effective',
            style: context.general.textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
