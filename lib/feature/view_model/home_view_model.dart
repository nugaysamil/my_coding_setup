// ignore_for_file: unnecessary_nullable_for_final_variable_declarations, unused_local_variable, must_be_immutable

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
    final response = await signInWithGithub();
    user = response;

    return response != null;
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
      name: githubProfile.name,
      shortBio: githubProfile.bio,
      photo: githubProfile.avatarUrl,
      githubUrl: githubProfile.url,
      userName: githubProfile.login,
    );
  }
}
