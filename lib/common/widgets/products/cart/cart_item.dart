import 'package:flutter/material.dart';
import 'package:wonwoo/common/widgets/images/t_rouded_image.dart';
import 'package:wonwoo/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:wonwoo/features/shop/screens/product_details/widgets/product_title_text.dart';
import 'package:wonwoo/utils/constants/colors.dart';
import 'package:wonwoo/utils/constants/image_string.dart';
import 'package:wonwoo/utils/constants/sizes.dart';
import 'package:wonwoo/utils/helpers/helper_functions.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///-- Image
        TRoundedImage(
          imageUrl: TImages.prod1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        /// -- Title, Price
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifiedIcon(title: 'Бренд'),
              const Flexible(
                child:
                    TProductTitleText(title: 'Название продукции', maxLines: 1),
              ),

              ///Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Цвет ',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: 'Зеленый ',
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
