import 'package:flutter/material.dart';
import 'package:my_coding/product/utility/enums/firestore_queries.dart';

@immutable
final class HomeViewModel {
  final usersQuery = FirebaseQueries.users.reference;

  /*  CollectionReference<Map<String, dynamic>> queries(FirebaseQueries query) {
    return query.reference;
  } */
}
