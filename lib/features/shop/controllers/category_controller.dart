import 'package:get/get.dart';
import 'package:wonwoo/data/repositories/categories/category_repository.dart';
import 'package:wonwoo/features/shop/models/category_model.dart';
import 'package:wonwoo/utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

// load category data
  Future<void> fetchCategories() async {
    try {
      //show loader
      isLoading.value = true;

      // fetch categories from Firestore
      final categories = await _categoryRepository.getAllCategories();

      // update categories list
      allCategories.assignAll(categories);

      // filter featured cat
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Ошибка!', message: e.toString());
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }

// load selected category data

// get category or sub products
}
