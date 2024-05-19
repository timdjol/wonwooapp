import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:wonwoo/common/widgets/success_screen/success_screen.dart';
import 'package:wonwoo/data/repositories/authentication/authentication_repository.dart';
import 'package:wonwoo/utils/constants/image_string.dart';
import 'package:wonwoo/utils/constants/text_strings.dart';
import 'package:wonwoo/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController{
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit(){
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // send email
  sendEmailVerification() async{
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: 'Успешно!', message: 'Пожалуйста подтвердите свою почту!');
    } catch(e){
      TLoaders.errorSnackBar(title: 'Ошибка!', message: e.toString());
    }
  }


  // timer to redirect
  setTimerForAutoRedirect(){
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user?.emailVerified ?? false){
        timer.cancel();
        Get.off(() => SuccessScreen(
            image: TImages.successRegister,
            title: TTexts.yourAccountCreatedTitle,
            subTitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ));
      }
    });
  }

  // check if email verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null && currentUser.emailVerified){
      Get.off( () => SuccessScreen(
        image: TImages.successRegister,
        title: TTexts.yourAccountCreatedTitle,
        subTitle: TTexts.yourAccountCreatedSubTitle,
        onPressed: () => AuthenticationRepository.instance.screenRedirect(),
      ));
    }
  }
}