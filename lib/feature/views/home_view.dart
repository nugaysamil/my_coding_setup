// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
// ignore_for_file: eol_at_end_of_file

import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'package:my_coding/feature/model/user.dart';
import 'package:my_coding/feature/view_model/home_view_model.dart';
import 'package:my_coding/feature/views/home_detail_view.dart';
import 'package:my_coding/feature/views/home_form_view.dart';
import 'package:my_coding/product/utility/firebase/firebase_base_model.dart';
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
    final homeViewModel = HomeViewModel();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.titleName,
          style: context.general.textTheme.titleMedium,
        ),
        actions: [
          InkWell(
            onTap: () async {
              final isAuthenticated =
                  await homeViewModel.checkUserGithubLogin();
              if (!isAuthenticated) return;
              if (homeViewModel.user == null) return;
              await context.route
                  .navigateToPage(HomeFormView(user: homeViewModel.user!));
            },
            child: CircleAvatar(
              backgroundColor: context.general.colorScheme.secondary,
              child: Image.asset(
                ImageConstants.icGithub,
              ),
            ),
          ),
        ],
      ),
      body: FirestoreListView<Map<String, dynamic>>(
        query: homeViewModel.usersQuery,
        itemBuilder: (context, snapshot) {
          final userMap = snapshot.data();

          if (userMap.isEmpty) return const SizedBox.shrink();

          return _UserCard(mapUser: userMap, id: snapshot.id);
        },
      ),
    );
  }
}

class _UserCard extends StatelessWidget {
  const _UserCard({
    required this.mapUser,
    required this.id,
    super.key,
  });

  final Map<String, dynamic> mapUser;
  final String id;

  @override
  Widget build(BuildContext context) {
    final user = User.fromJson(mapUser);
    print(user);

    if (user.isEmpty) return const SizedBox.shrink();

    return Card(
      child: ListTile(
        onTap: () {
          context.route.navigateToPage(
            HomeDetailView(
              user: BaseFirebaseModel<User>(id: id, data: user),
            ),
          );
        },
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user.photo!),
        ),
        title: Text(user.name!),
        subtitle: Text(user.shortBio!),
        trailing: IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: () {},
        ),
      ),
    );
  }
}
