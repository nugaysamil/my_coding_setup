// ignore_for_file: eol_at_end_of_file

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:my_coding/product/utility/image_constants.dart';
import 'package:my_coding/product/utility/locale_keys.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.titleName,
          style: context.general.textTheme.titleMedium,
        ),
        actions: [
          CircleAvatar(
            backgroundColor: context.general.colorScheme.secondary,
            child: Image.asset(
              ImageConstants.icGithub,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return const Card(
            child: ListTile(
              title: Text(''),
              subtitle: Text(''),
            ),
          );
        },
      ),
    );
  }
}
