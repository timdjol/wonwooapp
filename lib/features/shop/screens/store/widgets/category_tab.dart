import 'package:flutter/material.dart';
import 'package:wonwoo/common/widgets/brands/brand_show_case.dart';
import 'package:wonwoo/common/widgets/layouts/grid_layout.dart';
import 'package:wonwoo/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:wonwoo/common/widgets/texts/section_heading.dart';
import 'package:wonwoo/features/shop/models/category_model.dart';
import 'package:wonwoo/features/shop/models/product_model.dart';
import 'package:wonwoo/utils/constants/image_string.dart';
import 'package:wonwoo/utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      //physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brands
              const TBrandShowcase(
                  images: [TImages.prod1, TImages.prod1, TImages.prod1]),
              const TBrandShowcase(
                  images: [TImages.prod1, TImages.prod1, TImages.prod1]),

              /// -- Products
              TSectionHeading(
                  title: 'Вам может понравиться:', onPressed: () {}),
              const SizedBox(height: TSizes.spaceBtwItems),

              TGridLayout(
                itemCount: 6,
                itemBuilder: (_, index) =>
                    TProductCardVertical(product: ProductModel.empty()),
              ),

              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
