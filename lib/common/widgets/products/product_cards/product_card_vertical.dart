import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wonwoo/common/styles/shadows.dart';
import 'package:wonwoo/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:wonwoo/common/widgets/icons/t_circular_icon.dart';
import 'package:wonwoo/common/widgets/images/t_rouded_image.dart';
import 'package:wonwoo/common/widgets/texts/product_price_text.dart';
import 'package:wonwoo/common/widgets/texts/product_title_text.dart';
import 'package:wonwoo/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:wonwoo/features/shop/controllers/product_controller.dart';
import 'package:wonwoo/features/shop/models/product_model.dart';
import 'package:wonwoo/features/shop/screens/product_details/product_detail.dart';
import 'package:wonwoo/utils/constants/colors.dart';
import 'package:wonwoo/utils/constants/sizes.dart';
import 'package:wonwoo/utils/helpers/helper_functions.dart';

import '../../../../utils/constants/enums.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(product: product)),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [TShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? TColors.darkerGrey : TColors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Thumb
            TRoundedContainer(
              height: 180,
              width: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  //Thumb
                  Center(
                    child: TRoundedImage(
                        imageUrl: product.thumbnail, applyImageRadius: true, isNetworkImage: true),
                  ),

                  //Sale Tag
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text('$salePercentage%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: TColors.black)),
                    ),
                  ),

                  //Favorite Icon
                  const Positioned(
                    top: 0,
                    right: 0,
                    child:
                        TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
                  )
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),

            ///Details
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: product.title, smallSize: true),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  TBrandTitleWithVerifiedIcon(title: product.brand!.name),
                ],
              ),
            ),

            const Spacer(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                /// Price
                Flexible(
                  child: Column(
                    children: [
                      if(product.productType == ProductType.single.toString() && product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: TSizes.sm),
                          child: Text(
                              product.price.toString(),
                            style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),

                      /// price, show sale price as main price if sale exist
                      Padding(
                        padding: const EdgeInsets.only(left: TSizes.sm),
                        child: TProductPriceText(
                            price: controller.getProductPrice(product)),
                      )
                    ],
                  ),
                ),

                /// add to cart
                Container(
                    decoration: const BoxDecoration(
                      color: TColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TSizes.cardRadiusMd),
                        bottomRight: Radius.circular(TSizes.productImageRadius),
                      ),
                    ),
                    child: const SizedBox(
                      width: TSizes.iconLg * 1.2,
                      height: TSizes.iconLg * 1.2,
                      child: Icon(
                        Iconsax.add,
                        color: TColors.white,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
