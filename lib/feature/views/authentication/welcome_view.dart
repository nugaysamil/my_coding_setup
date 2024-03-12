// ignore_for_file: omit_local_variable_types

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';

import 'package:my_coding/feature/views/authentication/mixin/welcome_mixin.dart';

import 'package:my_coding/product/generation/assets.gen.dart';
import 'package:my_coding/product/utility/translation/locale_keys.g.dart';
import 'package:my_coding/product/utility/ui_general/custom_region.dart';
import 'package:my_coding/product/widget/white_elevated_button.dart';

mixin class IWelcomeView {}

class WelcomeView extends StatelessWidget with IWelcomeView, WelcomeMixin {
  WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRegion(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: context.padding.horizontalLow,
            child: Column(
              children: [
                Assets.images.imgCodeWelcome.image(),
                Text(
                  LocaleKeys.authentication_welcome_title.tr(),
                  style: context.general.textTheme.headlineLarge?.copyWith(),
                ),
                Text(
                  LocaleKeys.authentication_welcome_description.tr(),
                  style: context.general.textTheme.titleSmall,
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () => navigateToHome(context),
                  child: Center(
                    child: Text(
                      LocaleKeys.authentication_welcome_getStarted.tr(),
                    ),
                  ),
                ),
                Padding(
                  padding: context.padding.onlyTopNormal,
                  child: WhiteElevatedButton(
                    onPressed: () => onSignUpPressed(context),
                    title:
                        LocaleKeys.authentication_welcome_withoutAccount.tr(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
