import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wonwoo/common/widgets/login_signup/social_buttons.dart';
import 'package:wonwoo/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:wonwoo/utils/constants/sizes.dart';
import 'package:wonwoo/utils/constants/text_strings.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Title
              Text(TTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),

              const SizedBox(height: TSizes.spaceBtwSections),

              ///Form
              const TSignupForm(),

              const SizedBox(height: TSizes.spaceBtwSections),

              //Divider
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
