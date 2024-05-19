
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wonwoo/data/repositories/authentication/authentication_repository.dart';
import 'package:wonwoo/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:wonwoo/utils/constants/image_string.dart';
import 'package:wonwoo/utils/helpers/network_manager.dart';
import 'package:wonwoo/utils/popups/full_screen_loader.dart';
import 'package:wonwoo/utils/popups/loaders.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();

  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // send reset password email
  sendPasswordResetEmail() async {
    try{
      // start loading
      TFullScreenLoader.openLoadingDialog('В процессе вашего запроса', TImages.docerAnimation);

      // check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if(!forgetPasswordFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      // send email to reset
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // remove loader
      TFullScreenLoader.stopLoading();

      // show success screen
      TLoaders.successSnackBar(
          title: 'Отправлено на вашу почту',
          message: 'Ссылка сброса пароля отправлена на вашу почту!'
      );

      // redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));

    } catch(e){
      // remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Ошибка!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try{
      // start loading
      TFullScreenLoader.openLoadingDialog('В процессе вашего запроса', TImages.docerAnimation);

      // check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      // send email to reset
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // remove loader
      TFullScreenLoader.stopLoading();

      // show success screen
      TLoaders.successSnackBar(
          title: 'Отправлено на вашу почту',
          message: 'Ссылка сброса пароля отправлена на вашу почту!'
      );

    } catch(e){
      // remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Ошибка!', message: e.toString());

    }
  }

}