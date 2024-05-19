import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wonwoo/data/repositories/authentication/authentication_repository.dart';
import 'package:wonwoo/features/authentication/controllers/signup/verify_email_controller.dart';
import 'package:wonwoo/utils/constants/image_string.dart';
import 'package:wonwoo/utils/constants/sizes.dart';
import 'package:wonwoo/utils/constants/text_strings.dart';
import 'package:wonwoo/utils/helpers/helper_functions.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => AuthenticationRepository.instance.logout()),
              icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Image
              Image(
                image: const AssetImage(TImages.google),
                width: THelperFunctions.screenWidth() * 0.4,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///Title
              Text(TTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwItems),

              Text(email ?? '',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),

              const SizedBox(height: TSizes.spaceBtwItems),

              Text(TTexts.yourAccountCreatedSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),

              const SizedBox(height: TSizes.spaceBtwSections),

              ///Buttons
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => controller.checkEmailVerificationStatus(),
                      child: const Text(TTexts.tContinue)
                  )
              ),

              const SizedBox(height: TSizes.spaceBtwItems),

              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () => controller.sendEmailVerification(), child: const Text(TTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
