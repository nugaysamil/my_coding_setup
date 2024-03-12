import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kartal/kartal.dart';
import 'package:my_coding/feature/model/index.dart';
import 'package:my_coding/feature/view_model/home/home_form_view_model.dart';
import 'package:my_coding/feature/views/main/home/home_form_view.dart';

mixin HomeFormViewMixin on State<HomeFormView> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _computerController = TextEditingController();
  final TextEditingController _computerUrlController = TextEditingController();
  final TextEditingController _extensionController = TextEditingController();
  final TextEditingController _themeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final ValueNotifier<bool> isButtonEnabledNotifier =
      ValueNotifier<bool>(false);

  bool _isFormValidate = false;

  void onFormUpdate() {
    if (formKey.currentState == null) return;
    if (_isFormValidate == true) return;

    if (!formKey.currentState!.validate()) return;
    _isFormValidate = true;
    isButtonEnabledNotifier.value = true;
  }

  void _updateControllerFromUserDetail(UserDetail userDetail) {
    _computerController.text = userDetail.computerName ?? '';
    _computerUrlController.text = userDetail.computerUrl ?? '';
    _extensionController.text = userDetail.extensions?.join(',') ?? '';
    _themeController.text = userDetail.theme ?? '';
  }

  late final HomeFormViewModel _homeFormViewModel;

  @override
  void initState() {
    super.initState();
    _homeFormViewModel = HomeFormViewModel(widget.user);
    _controlFirstUserDetail();
  }

  Future<void> _controlFirstUserDetail() async {
    final userDetail = await _homeFormViewModel.checkUserBasicInformation();

    if (userDetail == null) return;

    _updateControllerFromUserDetail(userDetail);
  }

  Future<void> onSavePressed() async {
    final response = await _homeFormViewModel.saveUserDataToBackend(
      HomeFormModel(
        computerName: _computerController.text,
        computerUrl: _computerUrlController.text,
        extension: _extensionController.text,
        theme: _themeController.text,
      ),
    );
    if (!mounted) return;
    await context.route.pop(response);
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _computerController.dispose();
    _computerUrlController.dispose();
    _extensionController.dispose();
    _themeController.dispose();
    super.dispose();
  }

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get userNameController => _userNameController;
  TextEditingController get computerController => _computerController;
  TextEditingController get computerUrlController => _computerUrlController;
  TextEditingController get extensionController => _extensionController;
  TextEditingController get themeController => _themeController;
}

final class HomeFormModel {
  HomeFormModel({
    required this.computerName,
    required this.computerUrl,
    required this.extension,
    required this.theme,
  });

  final String computerName;
  final String computerUrl;
  final String extension;
  final String theme;

  bool get isEmpty =>
      computerName.isEmpty ||
      computerUrl.isEmpty ||
      extension.isEmpty ||
      theme.isEmpty;
}
