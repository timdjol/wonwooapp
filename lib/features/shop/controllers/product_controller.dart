import 'package:get/get.dart';
import 'package:wonwoo/data/repositories/product/product_repository.dart';
import 'package:wonwoo/features/shop/models/product_model.dart';
import 'package:wonwoo/utils/constants/enums.dart';
import 'package:wonwoo/utils/popups/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  void fetchFeaturedProducts() async {
    try {
      //show loader
      isLoading.value = true;

      //fetch products
      final products = await productRepository.getFeaturedProducts();

      // assign products
      featuredProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Ошибка!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //get product price
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    //if no variations exist
    if(product.productType == ProductType.single.toString()){
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    } else {
      //calc smallest and lagers price among variations
      for(var variation in product.productVariations!){
        //determine price (sale price if available)
        double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        //update price
        if(priceToConsider < smallestPrice){
          smallestPrice = priceToConsider;
        }
        if(priceToConsider > largestPrice){
          largestPrice = priceToConsider;
        }
      }

      //if smallest and largest price are same, return single price
      if(smallestPrice.isEqual(largestPrice)){
        return largestPrice.toString();
      } else {
        // otherwise, return a price range
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }

  /// calculate discount percent
  String? calculateSalePercentage(double orignalPrice, double? salePrice){
    if(salePrice == null || salePrice < 0.0) return null;
    if(orignalPrice <= 0) return null;

    double percentage = ((orignalPrice - salePrice) / orignalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  /// check product stock status
  String getProductStockStatus(int stock){
    return stock > 0 ? 'В наличии' : 'Нет в наличии';
  }

}
