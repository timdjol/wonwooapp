import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wonwoo/common/widgets/appbar/appbar.dart';
import 'package:wonwoo/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:wonwoo/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:wonwoo/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:wonwoo/common/widgets/texts/section_heading.dart';
import 'package:wonwoo/features/personalization/screens/address/address.dart';
import 'package:wonwoo/features/personalization/screens/profile/profile.dart';
import 'package:wonwoo/features/shop/screens/cart/cart.dart';
import 'package:wonwoo/features/shop/screens/order/order.dart';
import 'package:wonwoo/utils/constants/colors.dart';
import 'package:wonwoo/utils/constants/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text('Аккаунт',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: TColors.white)),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- User Profile
                  TUserProfileTile(
                      onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            /// -- Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Account Settings
                  const TSectionHeading(
                      title: 'Настройки аккаунта', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'Мои адреса',
                    subTitle: 'Укажите ваш для доставки',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'Моя корзина',
                    subTitle:
                        'Добавляйте/удаляйте продукции для оформления заказа',
                    onTap: () => Get.to(() => const CartScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'Мои заказы',
                    subTitle: 'Просматрвать статусы заказов',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'Мои купоны',
                    subTitle: 'Список купонов',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Уведомления',
                    subTitle: 'Просматривайте оповещения',
                    onTap: () {},
                  ),

                  /// -- App Settings
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(
                      title: 'Настройка приложения', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Загрузка данных',
                    subTitle: 'Загрузите данные с Cloud Firebase',
                    onTap: () {},
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Геолокация',
                    subTitle: 'Установите разрешение на GPS',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),

                  //logout


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
