import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:wonwoo/common/widgets/layouts/grid_layout.dart';
import 'package:wonwoo/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:wonwoo/utils/constants/sizes.dart';

import '../../../../features/shop/models/product_model.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: const [
            'Имя',
            'Дорогие выше',
            'Дешевые выше',
            'Распродажа',
            'Новинки',
            'Популярные'
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),

        //Products
        TGridLayout(
            itemCount: 12,
            itemBuilder: (_, index) =>
                TProductCardVertical(product: ProductModel.empty()))
      ],
    );
  }
}
