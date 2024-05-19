import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wonwoo/common/styles/spacing_styles.dart';
import 'package:wonwoo/features/authentication/screens/login/widgets/login_form.dart';
import 'package:wonwoo/common/widgets/login_signup/form_divider.dart';
import 'package:wonwoo/features/authentication/screens/login/widgets/login_header.dart';
import 'package:wonwoo/common/widgets/login_signup/social_buttons.dart';
import 'package:wonwoo/utils/constants/sizes.dart';
import 'package:wonwoo/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //logo
              const TLoginHeader(),

              //Form
              const TLoginForm(),

              ///divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),

              const SizedBox(height: TSizes.spaceBtwSections),

              ///Footer
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
