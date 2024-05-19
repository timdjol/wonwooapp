import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wonwoo/common/widgets/appbar/appbar.dart';
import 'package:wonwoo/common/widgets/appbar/tabbar.dart';
import 'package:wonwoo/common/widgets/brands/brand_card.dart';
import 'package:wonwoo/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:wonwoo/common/widgets/layouts/grid_layout.dart';
import 'package:wonwoo/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:wonwoo/common/widgets/texts/section_heading.dart';
import 'package:wonwoo/features/shop/controllers/category_controller.dart';
import 'package:wonwoo/features/shop/screens/brand/all_brands.dart';
import 'package:wonwoo/features/shop/screens/store/widgets/category_tab.dart';
import 'package:wonwoo/utils/constants/colors.dart';
import 'package:wonwoo/utils/constants/sizes.dart';
import 'package:wonwoo/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Магазин',
              style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            TCartCounterIcon(onPressed: () {}, iconColor: TColors.black),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// Search
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(
                          text: 'Поиск...',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      /// Brands
                      TSectionHeading(
                          title: 'Популярные бренды',
                          showActionButton: true,
                          onPressed: () =>
                              Get.to(() => const AllBrandsScreen())),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      TGridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return const TBrandCard(showBorder: false);
                          }),
                    ],
                  ),
                ),

                /// -- Tabs
                bottom: TTabBar(
                    tabs: categories
                        .map((category) => Tab(child: Text(category.name)))
                        .toList()),
              ),
            ];
          },
          body: TabBarView(
            children: categories.map((category) => TCategoryTab(category: category)).toList()
          ),
        ),
      ),
    );
  }
}
