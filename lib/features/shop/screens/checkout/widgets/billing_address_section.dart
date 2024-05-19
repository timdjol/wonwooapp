import 'package:flutter/material.dart';
import 'package:wonwoo/common/widgets/texts/section_heading.dart';
import 'package:wonwoo/utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
            title: 'Адрес доставки',
            buttonTitle: 'Изменить',
            showActionButton: true,
            onPressed: () {}),
        const SizedBox(height: TSizes.spaceBtwItems),
        Text('Wonwoo', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text('+996 999 999 999',
                style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(height: TSizes.spaceBtwItems),
            Expanded(
              child: Text('Кыргызстан г.Бишкек ул.Токтогула 47',
                  style: Theme.of(context).textTheme.bodyMedium,
                  softWrap: true),
            )
          ],
        ),
      ],
    );
  }
}
