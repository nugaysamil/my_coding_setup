import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:my_coding/feature/view_model/home/home_view_model.dart';
import 'package:my_coding/feature/views/main/home/home_form_view.dart';
import 'package:my_coding/feature/views/main/home/home_view.dart';

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
  }
}
