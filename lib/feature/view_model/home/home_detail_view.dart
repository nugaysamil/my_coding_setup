import 'package:flutter/material.dart';
import 'package:my_coding/feature/model/user.dart';
import 'package:my_coding/feature/model/user_details.dart';
import 'package:my_coding/product/utility/enums/firestore_queries.dart';
import 'package:my_coding/product/utility/firebase/firebase_base_model.dart';

final class HomeDetailViewModel {
  HomeDetailViewModel(this.user);

  final BaseFirebaseModel<User> user;

  Future<(User, UserDetail?)> fetchUserDetail() async {
    final userDetailQuery = FirebaseQueries.userDetail.reference;

    final response = await userDetailQuery
        .doc(user.id)
        .withConverter<BaseFirebaseModel<UserDetail>?>(
          fromFirestore: (snapshot, options) {
            final snapshotData = snapshot.data();

            if (snapshotData?.isEmpty ?? true) return null;

            return BaseFirebaseModel(
              id: snapshot.id,
              data: UserDetail.fromJson(snapshot.data()!),
            );
          },
          toFirestore: (value, options) => throw Exception('-'),
        )
        .get();

    return (user.data, response.data()?.data);
  }
}
