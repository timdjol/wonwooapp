import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wonwoo/common/widgets/appbar/appbar.dart';
import 'package:wonwoo/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:wonwoo/common/widgets/products/cart/coupon_widget.dart';
import 'package:wonwoo/common/widgets/success_screen/success_screen.dart';
import 'package:wonwoo/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:wonwoo/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:wonwoo/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:wonwoo/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:wonwoo/navigation_menu.dart';
import 'package:wonwoo/utils/constants/colors.dart';
import 'package:wonwoo/utils/constants/image_string.dart';
import 'package:wonwoo/utils/constants/sizes.dart';
import 'package:wonwoo/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Order Review',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Items in Cart
              const TCartItems(showAddRemoveButtons: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Coupon
              const TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.dark : TColors.white,
                child: const Column(
                  children: [
                    /// Pricing
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    /// Divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    /// Payment Methods
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    // Shipping Methods
                    TBillingAddressSection(),
                    SizedBox(height: TSizes.spaceBtwItems),
                  ],

                  /// Address
                ),
              ),
            ],
          ),
        ),
      ),

      ///-- Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(
                  () => SuccessScreen(
                    image: TImages.success,
                    title: 'Платеж успешно выполнен!',
                    subTitle: 'Ваш заказ скоро доставят!',
                    onPressed: () => Get.offAll(() => const NavigationMenu()),
                  ),
                ),
            child: const Text('Офорить \$256.0')),
      ),
    );
  }
}
