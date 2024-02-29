import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:my_coding/feature/model/user.dart';
import 'package:my_coding/feature/view_model/home_form_view_model.dart';
import 'package:my_coding/feature/views/mixin/home_form_view_mixin.dart';

class HomeFormView extends StatefulWidget {
  const HomeFormView({required this.user, super.key});
  final User user;

  @override
  State<HomeFormView> createState() => _HomeFormViewState();
}

class _HomeFormViewState extends State<HomeFormView> with HomeFormViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.name ?? ''),
        actions: [
          if (widget.user.photo.ext.isNotNullOrNoEmpty)
            CircleAvatar(
              backgroundImage: NetworkImage(widget.user.photo!),
            ),
        ],
      ),
      body: Form(
        key: formKey,
        onChanged: onFormUpdate,
        child: SingleChildScrollView(
          child: Column(
            children: [
              
              
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
                userNameController: themeController,
                hint: 'Theme',
              ),
              ValueListenableBuilder(
                valueListenable: isButtonEnabledNotifier,
                builder: (context, value, child) {
                  return ElevatedButton(
                    onPressed: !value ? null : onSavePressed,
                    child: const Text('Save'),
                  );
                },
              ),
            ],
          ),
        ),
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
