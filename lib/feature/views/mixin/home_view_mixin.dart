import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:my_coding/feature/view_model/index.dart';
import 'package:my_coding/feature/views/home_form_view.dart';
import 'package:my_coding/feature/views/home_view.dart';

mixin HomeViewMixin on State<HomeView> {
  final HomeViewModel _homeViewModel = HomeViewModel();

  Future<void> onGithubPressed() async {
    final isAuthenticated = await _homeViewModel.checkUserGithubLogin();
    if (!isAuthenticated) return;
    if (_homeViewModel.user == null) return;
    await context.route
        .navigateToPage(HomeFormView(user: _homeViewModel.user!));
  }

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      print(user);
    }
  }
}
