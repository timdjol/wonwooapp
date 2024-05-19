import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:wonwoo/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:wonwoo/common/widgets/products/ratings/rating_indicator.dart';
import 'package:wonwoo/utils/constants/colors.dart';
import 'package:wonwoo/utils/constants/image_string.dart';
import 'package:wonwoo/utils/constants/sizes.dart';
import 'package:wonwoo/utils/helpers/helper_functions.dart';

class TUserReviewCard extends StatelessWidget {
  const TUserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(TImages.userProfileImage1),
                ),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text('Пользователь',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        //Review
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('25.12.2024', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        const ReadMoreText(
          'Lorem ipsum dolor sit amet consectetur adipisicing elit. Optio commodi distinctio nobis harum eligendi, eum autem nisi fugit quas beatae hic, at explicabo accusantium sit quibusdam ipsa. Odit, ut quibusdam?',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: ' скрыть',
          trimCollapsedText: ' показать',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Wonwoo',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('26.12.2024',
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                const ReadMoreText(
                  'The user interface of the app is quite intuitive. Lorem ipsum dolor sit amet consectetur adipisicing elit. Lorem ipsum dolor sit amet consectetur adipisicing elit.',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' скрыть',
                  trimCollapsedText: ' показать',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }
}
