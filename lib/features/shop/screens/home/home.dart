import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wonwoo/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:wonwoo/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:wonwoo/common/widgets/layouts/grid_layout.dart';
import 'package:wonwoo/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:wonwoo/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:wonwoo/common/widgets/texts/section_heading.dart';
import 'package:wonwoo/features/shop/screens/all_products/all_products.dart';
import 'package:wonwoo/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:wonwoo/features/shop/screens/home/widgets/home_categories.dart';
import 'package:wonwoo/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:wonwoo/utils/constants/sizes.dart';

import '../../controllers/product_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  ///AppBar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ///SearchBar
                  TSearchContainer(text: 'Поиск...'),
                  SizedBox(height: TSizes.spaceBtwSections),

                  ///Categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        ///Heading
                        TSectionHeading(
                          title: 'Популярные категории',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems),

                        ///Categories
                        THomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            ///Carousel
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  ///Headigng
                  TSectionHeading(
                    title: 'Популярные',
                    showActionButton: true,
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  ///Popular products
                  Obx((){
                    if(controller.isLoading.value) return const TVerticalProductShimmer();

                    if(controller.featuredProducts.isEmpty){
                      return Center(child: Text('Данные не найдены!', style: Theme.of(context).textTheme.bodyMedium));
                    }
                    return TGridLayout(
                        itemCount: controller.featuredProducts.length,
                        itemBuilder: (_, index) => TProductCardVertical(product: controller.featuredProducts[index]),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
