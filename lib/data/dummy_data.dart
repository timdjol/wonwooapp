import 'package:wonwoo/features/shop/models/category_model.dart';
import 'package:wonwoo/utils/constants/image_string.dart';

class TDummyData{
  /// Banners
  // static final List<BannerModel> banners = [
  //   BannerModel(imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
  // ];

  /// Categories
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', name: 'Sports', image: TImages.categoryIcon, isFeatured: true),
    CategoryModel(id: '5', name: 'Furniture', image: TImages.categoryIcon, isFeatured: true),
    CategoryModel(id: '2', name: 'Clothes', image: TImages.categoryIcon, isFeatured: true),
    CategoryModel(id: '3', name: 'Animals', image: TImages.categoryIcon, isFeatured: true),
    CategoryModel(id: '4', name: 'Electronics', image: TImages.categoryIcon, isFeatured: true),
    CategoryModel(id: '6', name: 'Shoes', image: TImages.categoryIcon, isFeatured: true),
    CategoryModel(id: '7', name: 'Cosmetics', image: TImages.categoryIcon, isFeatured: true),
  ];

}