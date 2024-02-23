import 'package:cloud_firestore/cloud_firestore.dart';

enum FirebaseQueries {
  userDetail,
  users;

  CollectionReference<Map<String, dynamic>> get reference =>
      FirebaseFirestore.instance.collection(name);
}
