import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wonwoo/data/repositories/authentication/authentication_repository.dart';
import 'package:wonwoo/features/personalization/controllers/user_controller.dart';
import 'package:wonwoo/utils/constants/image_string.dart';
import 'package:wonwoo/utils/helpers/network_manager.dart';
import 'package:wonwoo/utils/popups/full_screen_loader.dart';
import 'package:wonwoo/utils/popups/loaders.dart';

class LoginController extends GetxController{

  /// variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit(){
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  //email and password Sign In
  Future<void> emailAndPasswordSignIn() async {
    try {
      // start loading
      TFullScreenLoader.openLoadingDialog('Войти в систему', TImages.docerAnimation);

      // check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if( !isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if(!loginFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      //save data if remember me
      if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //login user
      await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      //      final userCredentials = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //remove loader
      TFullScreenLoader.stopLoading();

      //redirect
      AuthenticationRepository.instance.screenRedirect();

    } catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Ошибка!', message: e.toString());
    }
  }

  // Google Sign In
  Future<void> googleSignIn() async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDialog('Войти через ...', TImages.docerAnimation);

      // check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if( !isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //Google auth
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      //save user record
      await userController.saveUserRecord(userCredentials);

      //remove Loading
      TFullScreenLoader.stopLoading();

      //redirect
      AuthenticationRepository.instance.screenRedirect();

    } catch(e){
      //remove Loading
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Ошибка!', message: e.toString());
    }
  }

}