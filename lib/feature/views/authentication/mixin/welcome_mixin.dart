import 'package:flutter/material.dart';
import 'package:my_coding/feature/view_model/authentication/welcome_view_model.dart';
import 'package:my_coding/feature/views/authentication/welcome_view.dart';
import 'package:my_coding/feature/views/home/home_view.dart';
import 'package:my_coding/product/utility/navigator_utility.dart';

mixin WelcomeMixin on StatelessWidget,IWelcomeView {
  final WelcomeViewModel welcomeViewModel = WelcomeViewModel();

  Future<void> onSignUpPressed(BuildContext context) async {
    final user = await welcomeViewModel.signUpWithGithub();
    if (user == null) return;
    if (!context.mounted) return;
    NavigatorUtility(context).pushAndReplace(
      const HomeView(),
    );
  }
}
