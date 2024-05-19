import 'package:flutter/material.dart';
import 'package:wonwoo/common/widgets/appbar/appbar.dart';
import 'package:wonwoo/common/widgets/products/ratings/rating_indicator.dart';
import 'package:wonwoo/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:wonwoo/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:wonwoo/utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Отзывы & Рейтинги')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings and reviews are verified and are from people who use device'),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// -Overall Product Ratings
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 4.5),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// User Reviews List
              const TUserReviewCard(),
              const TUserReviewCard(),
              const TUserReviewCard(),
              const TUserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
