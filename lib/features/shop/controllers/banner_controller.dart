import 'package:get/get.dart';
import 'package:wonwoo/data/repositories/banners/banner_repository.dart';
import 'package:wonwoo/features/shop/models/banner_model.dart';

import '../../../utils/popups/loaders.dart';

class BannerController extends GetxController {
  // variables
  final isLoading = false.obs;
  final carouselCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  // update page nav dots
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  // fetch banners
  Future<void> fetchBanners() async {
    try {
      //show loader
      isLoading.value = true;

      //fetch banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      //assign banners
      this.banners.assignAll(banners);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Ошибка!', message: e.toString());
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }
}
