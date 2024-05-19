import 'package:flutter/material.dart';
import 'package:wonwoo/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:wonwoo/utils/constants/sizes.dart';
import 'package:wonwoo/utils/device/device_utitlity.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSizes.defaultSpace - 25,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: const Text('Пропустить'),
        ));
  }
}
