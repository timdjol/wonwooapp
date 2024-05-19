import 'package:flutter/material.dart';
import 'package:wonwoo/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:wonwoo/common/widgets/images/t_circular_image.dart';
import 'package:wonwoo/common/widgets/texts/product_price_text.dart';
import 'package:wonwoo/common/widgets/texts/product_title_text.dart';
import 'package:wonwoo/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:wonwoo/utils/constants/colors.dart';
import 'package:wonwoo/utils/constants/enums.dart';
import 'package:wonwoo/utils/constants/image_string.dart';
import 'package:wonwoo/utils/constants/sizes.dart';
import 'package:wonwoo/utils/helpers/helper_functions.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// -- Price
        Row(
          ///-- Sale Tag
          children: [
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text('25%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.black)),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),

            ///-- Price
            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: TSizes.spaceBtwItems),
            const TProductPriceText(price: '175', isLarge: true),
          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems / 1.5),

        ///-- Title
        const TProductTitleText(title: 'Название продукции'),
        const SizedBox(width: TSizes.spaceBtwItems / 1.5),

        ///-- Stock
        Row(
          children: [
            const TProductTitleText(title: 'Статус'),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('В наличии', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),

        const SizedBox(width: TSizes.spaceBtwItems / 1.5),

        ///-- Brand
        Row(
          children: [
            TCircularImage(
              image: TImages.categoryIcon,
              width: 32,
              height: 32,
              overlayColor: darkMode ? TColors.white : TColors.black,
            ),
            const TBrandTitleWithVerifiedIcon(
                title: 'Бренд', brandTextSize: TextSizes.medium),
          ],
        ),
      ],
    );
  }
}
