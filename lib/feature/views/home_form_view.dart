import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:my_coding/feature/views/mixin/home_form_view_mixin.dart';

class HomeFormView extends StatefulWidget {
  const HomeFormView({super.key});

  @override
  State<HomeFormView> createState() => _HomeFormViewState();
}

class _HomeFormViewState extends State<HomeFormView> with HomeFormViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          _FormController(
            userNameController: userNameController,
            hint: 'Github username',
          ),
          _FormController(
            userNameController: computerController,
            hint: 'Computer Name',
          ),
          _FormController(
            userNameController: computerUrlController,
            hint: 'Computer Url',
          ),
          _FormController(
            userNameController: extensionController,
            hint: 'Extensions',
          ),
          _FormController(
            userNameController: settingValueController,
            hint: 'Setting value',
          ),
          _FormController(
            userNameController: themeController,
            hint: 'Theme',
          ),
        ],
      ),
    );
  }
}

class _FormController extends StatelessWidget {
  const _FormController({
    required TextEditingController userNameController,
    required this.hint,
  }) : _userNameController = userNameController;

  final TextEditingController _userNameController;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopLow,
      child: TextFormField(
        validator: (value) => value!.isEmpty ? 'Cannot be empty' : null,
        controller: _userNameController,
        decoration: InputDecoration(
          hintText: hint,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
