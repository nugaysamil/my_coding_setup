// ignore_for_file: unused_local_variable

import 'package:my_coding/feature/model/index.dart';
import 'package:my_coding/feature/model/user.dart';
import 'package:my_coding/feature/views/mixin/home_form_view_mixin.dart';
import 'package:my_coding/product/utility/enums/firestore_queries.dart';

final class HomeFormViewModel {
  HomeFormViewModel(this.user);

  final User user;

  Future<bool> saveUserDataToBackend(HomeFormModel model) async {
    final itemExtensionsSplitted = model.extension.split(',');
    final itemExtensions = itemExtensionsSplitted.map((e) => e.trim()).toList();

    // user data to backend
    final userResponse =
        await FirebaseQueries.users.reference.add(user.toJson());

    // 2. user details to backend

    final userDetail = UserDetail(
      computerName: model.computerName,
      computerUrl: model.computerUrl,
      theme: model.theme,
      extensions: itemExtensions,
    );

    final userDetailResponse = await FirebaseQueries.userDetail.reference
        .doc(userResponse.id)
        .set(userDetail.toJson());

    return true;
  }
}
