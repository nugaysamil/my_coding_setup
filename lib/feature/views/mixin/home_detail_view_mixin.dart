import 'package:flutter/material.dart';
import 'package:my_coding/feature/model/user.dart';
import 'package:my_coding/feature/model/user_details.dart';
import 'package:my_coding/feature/view_model/home_detail_view.dart';
import 'package:my_coding/feature/views/home_detail_view.dart';

mixin HomeDetailViewMixin on State<HomeDetailView> {
  late final HomeDetailViewModel _detailViewModel;
  final ValueNotifier<UserDetail?> userDetailNotifier = ValueNotifier(null);
  late final User user;

  @override
  void initState() {
    super.initState();

    user = widget.user.data;
    _detailViewModel = HomeDetailViewModel(widget.user);
    _fetchUser();
  }

  Future<void> _fetchUser() async {
    final (_, userDetail) = await _detailViewModel.fetchUserDetail();
    userDetailNotifier.value = userDetail;
  }
}
