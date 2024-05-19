import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wonwoo/features/authentication/controllers/signup/signup_controller.dart';
import 'package:wonwoo/utils/constants/sizes.dart';
import 'package:wonwoo/utils/constants/text_strings.dart';
import 'package:wonwoo/utils/validators/validation.dart';


class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                    controller: controller.firstName,
                  validator: (value) =>
                      TValidator.validateEmptyText('Имя', value),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      TValidator.validateEmptyText('Фамилия', value),
                    controller: controller.lastName,
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          ///Username
          TextFormField(
              validator: (value) =>
                  TValidator.validateEmptyText('Логин', value),
              controller: controller.username,
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit))),

          const SizedBox(height: TSizes.spaceBtwInputFields),

          ///Email
          TextFormField(
              validator: (value) => TValidator.validateEmail(value),
              controller: controller.email,
              decoration: const InputDecoration(
                  labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct))),

          const SizedBox(height: TSizes.spaceBtwInputFields),

          ///phoneNumber
          TextFormField(
              validator: (value) => TValidator.validatePhoneNumber(value),
              controller: controller.phoneNumber,
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.phoneNumber,
                  prefixIcon: Icon(Iconsax.call))),

          const SizedBox(height: TSizes.spaceBtwInputFields),

          ///password
          Obx(
              () => TextFormField(
                validator: (value) => TValidator.validatePassword(value),
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    labelText: TTexts.password,
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                    ),
                ),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwSections),

          ///btn
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
