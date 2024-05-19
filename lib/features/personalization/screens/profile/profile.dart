import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wonwoo/common/widgets/appbar/appbar.dart';
import 'package:wonwoo/common/widgets/images/t_circular_image.dart';
import 'package:wonwoo/common/widgets/texts/section_heading.dart';
import 'package:wonwoo/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:wonwoo/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:wonwoo/utils/constants/image_string.dart';
import 'package:wonwoo/utils/constants/sizes.dart';

import '../../../../common/widgets/shimmers/shimmer.dart';
import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: Text('Профиль')),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Profile Image
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty ? networkImage : TImages.user;
                      return controller.imageUploading.value
                        ? const TShimmerEffect(width: 80, height: 80, radius: 80)
                        : TCircularImage(
                          image: image, width: 80, height: 80, isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Изменить изображение')),
                  ],
                ),
              ),

              /// -- Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              const TSectionHeading(title: 'Профиль', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                  title: 'Имя',
                  value: controller.user.value.fullName,
                  onPressed: () => Get.to(() => const ChangeName())),
              TProfileMenu(
                  title: 'Логин',
                  value: controller.user.value.username,
                  onPressed: () {}),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                  title: 'User ID',
                  value: controller.user.value.id,
                  icon: Iconsax.copy,
                  onPressed: () {}),
              TProfileMenu(
                  title: 'Email',
                  value: controller.user.value.email,
                  onPressed: () {}),
              TProfileMenu(
                  title: 'Номер телефона',
                  value: controller.user.value.phoneNumber,
                  onPressed: () {}),
              TProfileMenu(title: 'Пол', value: 'Муж', onPressed: () {}),

              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                  child: TextButton(
                onPressed: () => controller.deleteAccountWarningPopup(),
                child: const Text('Закрыть аккаунт',
                    style: TextStyle(color: Colors.red)),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
