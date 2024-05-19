import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wonwoo/data/repositories/user/user_repository.dart';
import 'package:wonwoo/features/personalization/controllers/user_controller.dart';
import 'package:wonwoo/features/personalization/screens/profile/profile.dart';
import 'package:wonwoo/utils/constants/image_string.dart';
import 'package:wonwoo/utils/helpers/network_manager.dart';
import 'package:wonwoo/utils/popups/full_screen_loader.dart';
import 'package:wonwoo/utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();
  
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();
  
  // init user data home screen
  @override
  void onInit(){
    initializeNames();
    super.onInit();
  }
  
  // fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }
  
  Future<void> updateUserName() async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDialog('Обновляем вашу информацию', TImages.docerAnimation);
      
      //check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }
      
      //form validation
      if(!updateUserNameFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }
      
      // update users first and last name in Firebase
      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);
      
      // update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();
      
      //remove loader
      TFullScreenLoader.stopLoading();
      
      //show success message
      TLoaders.successSnackBar(title: 'Поздравляем!', message: 'Ваше имя обновлено!');
      
      //move prev screen
      Get.off(() => const ProfileScreen());
      
    } catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Ошибка!', message: e.toString());
    }
  } 

}