import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:wonwoo/common/widgets/texts/section_heading.dart';
import 'package:wonwoo/features/shop/models/product_model.dart';
import 'package:wonwoo/features/shop/screens/checkout/checkout.dart';
import 'package:wonwoo/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:wonwoo/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:wonwoo/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:wonwoo/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:wonwoo/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:wonwoo/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:wonwoo/utils/constants/sizes.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Slider
            const TProductImageSlider(),

            /// -- Details
            Padding(
              padding: const EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Rating
                  const TRatingAndShare(),

                  /// -- Price, Title, Stock
                  const TProductMetaData(),

                  /// -- Attributes
                  const ProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => Get.to(() => const CheckoutScreen()),
                          child: const Text('Оформить'))),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // -- Description
                  const TSectionHeading(title: 'Описание'),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    'This is a Product description for Product Title. Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestias eum nisi ducimus mollitia obcaecati pariatur architecto. Esse, assumenda. Culpa qui quae ex id, debitis ut maxime fugit error dolores temporibus.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Показать больше',
                    trimExpandedText: ' Скрыть',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  // -- Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                          title: 'Отзывы(199)', showActionButton: false),
                      IconButton(
                          icon: const Icon(Iconsax.arrow_right_3, size: 18),
                          onPressed: () =>
                              Get.to(() => const ProductReviewsScreen())),
                    ],
                  ),

                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
