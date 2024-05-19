import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wonwoo/common/widgets/appbar/appbar.dart';
import 'package:wonwoo/common/widgets/brands/brand_card.dart';
import 'package:wonwoo/common/widgets/layouts/grid_layout.dart';
import 'package:wonwoo/common/widgets/texts/section_heading.dart';
import 'package:wonwoo/features/shop/screens/brand/brand_products.dart';
import 'package:wonwoo/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Бренд'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TSectionHeading(title: 'Бренд'),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Brands
              TGridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (context, index) => TBrandCard(
                  showBorder: true,
                  onTap: () => Get.to(() => const BrandProducts()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
