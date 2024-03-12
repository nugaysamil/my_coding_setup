// ignore_for_file: public_member_api_docs, sort_constructors_first, unused_field, unused_element

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:my_coding/feature/model/index.dart';

import 'package:my_coding/feature/views/main/home/mixin/home_detail_view_mixin.dart';
import 'package:my_coding/product/utility/firebase/firebase_base_model.dart';

class HomeDetailView extends StatefulWidget {
  const HomeDetailView({
    required this.user,
    super.key,
  });
  final BaseFirebaseModel<User> user;

  @override
  State<HomeDetailView> createState() => _HomeDetailViewState();
}

class _HomeDetailViewState extends State<HomeDetailView>
    with HomeDetailViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(user.photo ?? ''),
          ),
          ValueListenableBuilder(
            valueListenable: userDetailNotifier,
            builder: (context, value, child) {
              if (value == null) return const SizedBox.shrink();
              return _UserDetailCard(userDetail: value);
            },
          ),
        ],
      ),
    );
  }
}

class _UserDetailCard extends StatelessWidget {
  const _UserDetailCard({required this.userDetail, super.key});
  final UserDetail userDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Computer : ${userDetail.computerName}',
        ),
        TextButton(
          onPressed: () {
            userDetail.computerUrl.ext.launchWebsite;
          },
          child: Text(
            'Computer Url : ${userDetail.computerUrl}',
            style: context.general.textTheme.bodyMedium?.copyWith(
              color: context.general.colorScheme.secondary,
            ),
          ),
        ),
        Text(
          'Operating System : ${userDetail.theme}',
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: userDetail.extensions?.length ?? 0,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(userDetail.extensions?[index] ?? ''),
            );
          },
        ),
      ],
    );
  }
}
