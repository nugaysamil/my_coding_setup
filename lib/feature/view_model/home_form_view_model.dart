// ignore_for_file: unused_local_variable

import 'package:my_coding/feature/model/index.dart';
import 'package:my_coding/feature/model/user.dart';
import 'package:my_coding/feature/views/mixin/home_form_view_mixin.dart';
import 'package:my_coding/product/utility/enums/firestore_queries.dart';

final class HomeFormViewModel {
  HomeFormViewModel(User user) : _user = user;

  final User _user;

  Future<UserDetail?> checkUserBasicInformation() async {
    final userDetailSnapshot =
        await FirebaseQueries.userDetail.reference.doc(_getUserId()).get();

    if (!userDetailSnapshot.exists) return null;
    final jsonData = userDetailSnapshot.data();
    if (jsonData == null) return null;

    final userDetail = UserDetail.fromJson(jsonData);

    return userDetail;
  }

  

  Future<bool> saveUserDataToBackend(HomeFormModel model) async {
    if (model.isEmpty) return false;
    final localUserId = _getUserId();
    final itemExtensionsSplitted = model.extension.split(',');
    final itemExtensions = itemExtensionsSplitted.map((e) => e.trim()).toList();

    // user data to backend
    
        await FirebaseQueries.users.reference.doc(localUserId).set(
              _user.toJson(),
            );

    // 2. user details to backend

    final userDetail = UserDetail(
      computerName: model.computerName,
      computerUrl: model.computerUrl,
      theme: model.theme,
      extensions: itemExtensions,
    );

    final userDetailResponse = await FirebaseQueries.userDetail.reference
        .doc(localUserId)
        .set(userDetail.toJson());

    return true;
  }

  String _getUserId() {
    final userId = _user.githubId.toString();
    if (userId.isEmpty) throw Exception('user id is not null');

    return userId;
  }
}
