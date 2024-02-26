

import 'package:flutter/material.dart';
import 'package:my_coding/feature/views/home_form_view.dart';

mixin HomeFormViewMixin on State<HomeFormView> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _computerController = TextEditingController();
  final TextEditingController _computerUrlController = TextEditingController();
  final TextEditingController _extensionController = TextEditingController();
  final TextEditingController _settingValueController = TextEditingController();
  final TextEditingController _themeController = TextEditingController();

  TextEditingController get userNameController => _userNameController;
  TextEditingController get computerController => _computerController;
  TextEditingController get computerUrlController => _computerUrlController;
  TextEditingController get extensionController => _extensionController;
  TextEditingController get settingValueController => _settingValueController;
  TextEditingController get themeController => _themeController;


  @override
  void dispose() {
    _userNameController.dispose();
    _computerController.dispose();
    _computerUrlController.dispose();
    _extensionController.dispose();
    _settingValueController.dispose();
    _themeController.dispose();
    super.dispose();
  }
}
