import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wonwoo/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:wonwoo/utils/constants/colors.dart';
import 'package:wonwoo/utils/constants/sizes.dart';
import 'package:wonwoo/utils/device/device_utitlity.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
            shape: const CircleBorder(), backgroundColor: TColors.primary),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
