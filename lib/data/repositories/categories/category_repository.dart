
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wonwoo/features/shop/models/category_model.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/firebase_storage_service.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;

  // get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
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

  // get sub categories

// upload categories to the cloud Firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      //upload all categories
      final storage = Get.put(TFirebaseStorageService());

      // loop each category
      for (var category in categories) {
        // get image data link from local
        final file = await storage.getImageDataFromAssets(category.image);

        //upload image and get url
        final url =
            await storage.uploadImageData('Categories', file, category.name);

        // assign url to category image attr
        category.image = url;

        // store category in Firebase
        await _db
            .collection('Categories')
            .doc(category.id)
            .set(category.toJson());
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
