import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wonwoo/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:wonwoo/utils/constants/colors.dart';
import 'package:wonwoo/utils/constants/sizes.dart';
import 'package:wonwoo/utils/device/device_utitlity.dart';
import 'package:wonwoo/utils/helpers/helper_functions.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = THelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 4,
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? TColors.light : TColors.dark, dotHeight: 6),
      ),
    );
  }
}
