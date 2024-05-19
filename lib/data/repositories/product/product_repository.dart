import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/product_model.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/firebase_storage_service.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  //firestore instance from db
  final _db = FirebaseFirestore.instance;

  //get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Что-то пошло не так, пожалуйста повторите!';
    }
  }

  //upload dummy ata to the Cloud
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      //upload all categories
      final storage = Get.put(TFirebaseStorageService());

      // loop each category
      for (var product in products) {
        // get image data link from local
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        //upload image and get url
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        // assign url to category image attr
        product.thumbnail = url;

        // product list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            //get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            //upload image and get Url
            final url = await storage.uploadImageData(
                'Products/Image', assetImage, image);

            //assign url to product.thumbnail attr
            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }

        //upload variation images
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            //get image data link from local
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);

            //upload image and get url
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, variation.image);

            //assign url to variation image attr
            variation.image = url;
          }
        }

        // store category in Firebase
        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Что-то пошло не так, пожалуйста повторите!';
    }
  }
}
