import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:my_coding/feature/model/github_profile.dart';
import 'package:my_coding/feature/model/user.dart';

final class WelcomeViewModel {

  

  Future<User?> signUpWithGithub() async {
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