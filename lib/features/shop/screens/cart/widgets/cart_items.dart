import 'package:flutter/material.dart';
import 'package:wonwoo/common/widgets/products/cart/add_remove_button.dart';
import 'package:wonwoo/common/widgets/products/cart/cart_item.dart';
import 'package:wonwoo/features/shop/screens/product_details/widgets/product_price_text.dart';
import 'package:wonwoo/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 3,
      separatorBuilder: (_, __) =>
          const SizedBox(height: TSizes.spaceBtwSections),
      itemBuilder: (_, index) => Column(
        children: [
          /// Cart Item
          const TCartItem(),
          if (showAddRemoveButtons)
            const SizedBox(height: TSizes.spaceBtwItems),

          /// Add Remove button
          if (showAddRemoveButtons)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 70),
                    TProductQuantityWithAddRemoveButton(),
                  ],
                ),
                TProductPriceText(price: '256', isLarge: false),
              ],
            ),
        ],
      ),
    );
  }
}
