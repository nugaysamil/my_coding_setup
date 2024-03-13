import 'package:flutter/material.dart';
import 'package:my_coding/feature/view_model/authentication/welcome_view_model.dart';
import 'package:my_coding/feature/views/authentication/welcome_view.dart';
import 'package:my_coding/feature/views/main/home/home_view.dart';
import 'package:my_coding/feature/views/main/tab/main_tab_view.dart';
import 'package:my_coding/product/state/user_context.dart';
import 'package:my_coding/product/utility/navigator_utility.dart';

mixin WelcomeMixin on StatelessWidget,IWelcomeView {
  final WelcomeViewModel welcomeViewModel = WelcomeViewModel();



  void navigateToHome(BuildContext context) {
    NavigatorUtility(context).pushAndReplace(const MainTabView());
  }

  Future<void> onSignUpPressed(BuildContext context) async {
    final user = await welcomeViewModel.signUpWithGithub();
    if (user == null) return;
    if (!context.mounted) return;
    welcomeViewModel.saveUserToStateAndNavigate(user, UserContext.of(context));
    navigateToHome(context);
    
  }
}
