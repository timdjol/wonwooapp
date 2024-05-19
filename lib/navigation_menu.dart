import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wonwoo/features/personalization/screens/settings/settings.dart';
import 'package:wonwoo/features/shop/screens/home/home.dart';
import 'package:wonwoo/features/shop/screens/store/store.dart';
import 'package:wonwoo/features/shop/screens/wishlist/wishlist.dart';
import 'package:wonwoo/utils/constants/colors.dart';
import 'package:wonwoo/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? TColors.black : Colors.white,
          indicatorColor: darkMode
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Домой'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Магазин'),
            NavigationDestination(
                icon: Icon(Iconsax.heart), label: 'Избранные'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Профиль'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const StoreScreen(),
    const FavoriteScreen(),
    const SettingsScreen(),
  ];
}
