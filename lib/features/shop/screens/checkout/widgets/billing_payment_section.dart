import 'package:flutter/material.dart';
import 'package:wonwoo/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:wonwoo/common/widgets/texts/section_heading.dart';
import 'package:wonwoo/utils/constants/colors.dart';
import 'package:wonwoo/utils/constants/image_string.dart';
import 'package:wonwoo/utils/constants/sizes.dart';
import 'package:wonwoo/utils/helpers/helper_functions.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        const TSectionHeading(
            title: 'Способы оплаты',
            buttonTitle: 'Изменить',
            showActionButton: true),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            TRoundedContainer(
              width: 60,
              height: 60,
              backgroundColor: dark ? TColors.light : TColors.white,
              padding: const EdgeInsets.all(TSizes.sm),
              child: const Image(
                  image: AssetImage(TImages.pay), fit: BoxFit.contain),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Text('VISA', style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ],
    );
  }
}
