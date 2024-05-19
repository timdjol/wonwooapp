import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wonwoo/common/widgets/appbar/appbar.dart';
import 'package:wonwoo/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:wonwoo/features/shop/screens/checkout/checkout.dart';
import 'package:wonwoo/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title:
            Text('Корзина', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        /// -- Items in Cart
        child: TCartItems(),
      ),

      ///-- Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => const CheckoutScreen()),
            child: const Text('Оформление заказа \$256.0')),
      ),
    );
  }
}
