// ignore_for_file: unnecessary_nullable_for_final_variable_declarations, unused_local_variable, must_be_immutable, unused_element

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_coding/feature/model/github_profile.dart';
import 'package:my_coding/feature/model/user.dart';
import 'package:my_coding/product/utility/enums/firestore_queries.dart';

@immutable
final class HomeViewModel {
  final usersQuery = FirebaseQueries.users.reference;
  User? user;

  Future<bool> checkUserGithubLogin() async {
    // check user data from locale state
/*     user = _fetchUserProviderData();
    if (user != null) return true; */

    // when can not find any user, it will open auth screen for github

    final response = await signInWithGithub();
    user = response;

    return response != null;
  }

  User? _fetchUserProviderData() {
    final instance = auth.FirebaseAuth.instance;

    final githubUserFromState = instance.currentUser?.providerData.firstWhere(
      (element) => element.providerId == 'github.com',
    );

    if (githubUserFromState != null) {
      return User(
        githubId: int.tryParse(githubUserFromState.uid ?? ''),
        name: githubUserFromState.displayName,
        photo: githubUserFromState.photoURL,
      );
    }
    return null;
  }

  Future<User?> signInWithGithub() async {
    final instance = auth.FirebaseAuth.instance;

    auth.UserCredential userCredential;

    if (kIsWeb) {
      userCredential = userCredential =
          await instance.signInWithPopup(auth.GithubAuthProvider());
    } else {
      userCredential = userCredential =
          await instance.signInWithProvider(auth.GithubAuthProvider());
    }
    final response = userCredential.additionalUserInfo?.profile;
    if (response == null) return null;
    final githubProfile = GithubProfile.fromJson(response);
    return User(
      githubId: githubProfile.id,
      name: githubProfile.name,
      shortBio: githubProfile.bio,
      photo: githubProfile.avatarUrl,
      githubUrl: githubProfile.url,
      userName: githubProfile.login,
    );
  }
}
