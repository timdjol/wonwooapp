import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wonwoo/common/widgets/appbar/appbar.dart';
import 'package:wonwoo/features/personalization/controllers/update_name_controller.dart';
import 'package:wonwoo/utils/constants/sizes.dart';
import 'package:wonwoo/utils/validators/validation.dart';

import '../../../../../utils/constants/text_strings.dart';
class ChangeName extends StatelessWidget{
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context){
    final controller = Get.put(UpdateNameController());

    return Scaffold(
      //custom app bar
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Изменить имя', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //headings
            Text('Используйте реальное имя для верификации', style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: TSizes.spaceBtwSections),

            // text field and button
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) => TValidator.validateEmptyText('FirstName', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: TTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) => TValidator.validateEmptyText('LastName', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                  )
                ],
              )
            ),

            const SizedBox(height: TSizes.spaceBtwSections),

            // save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () => controller.updateUserName(), child: const Text('Сохранить'),)
            )
          ],
        )
      ),
    );
  }
}