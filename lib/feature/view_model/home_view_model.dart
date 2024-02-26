// ignore_for_file: unnecessary_nullable_for_final_variable_declarations, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:my_coding/feature/model/user.dart';
import 'package:my_coding/product/utility/enums/firestore_queries.dart';

@immutable
final class HomeViewModel {
  final usersQuery = FirebaseQueries.users.reference;
  User? user;

  /*  CollectionReference<Map<String, dynamic>> queries(FirebaseQueries query) {
    return query.reference;
  } */

  Future<bool> checkUserGithubLogin() async {
    final response = await signInWithGithub();
    user = response;

    return response != null;
  }

  Future<User?> signInWithGithub() async {
    final instance = auth.FirebaseAuth.instance;

    final userCredential =
        await instance.signInWithProvider(auth.GithubAuthProvider());
    final token = userCredential.credential?.accessToken;
    final response = userCredential.user;
    if (response != null) {}
    return User(
      name: response?.displayName ?? '',
      shortBio: response?.email ?? '',
      photo: response?.photoURL ?? '',
    );
  }
}
