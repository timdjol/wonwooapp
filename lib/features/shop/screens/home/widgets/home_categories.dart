import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wonwoo/common/widgets/shimmers/category_shimmer.dart';
import 'package:wonwoo/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:wonwoo/features/shop/controllers/category_controller.dart';
import 'package:wonwoo/features/shop/screens/sub_category/sub_categories.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(() {
      if(categoryController.isLoading.value) return const TCategoryShimmerEffect();

      if(categoryController.featuredCategories.isEmpty){
        return Center(child: Text('Данные не найдены!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
      }
        return  SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];
              return TVerticalImageText(
                image: category.image,
                title: category.name,
                onTap: () => Get.to(() => const SubCategoriesScreen()),
              );
            },
          ),
        );
      }
    );
  }
}
