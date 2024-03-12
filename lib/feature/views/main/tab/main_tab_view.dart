// ignore_for_file: only_throw_errors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:my_coding/feature/views/main/tab/main_tab_view_mixin.dart';
import 'package:my_coding/product/utility/app_constant.dart';

part '../tab/widgets/main_tab_widget.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> with MainTabViewMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: MainTabItems.tabs.length,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        body: const TabBarView(
          children: MainTabViewMixin.tabBarViews,
        ),
        bottomNavigationBar: const _BottomAppBar(),
        appBar: const _AppBar(),
      ),
    );
  }
}
