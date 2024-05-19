import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wonwoo/data/repositories/authentication/authentication_repository.dart';
import 'package:wonwoo/data/repositories/user/user_repository.dart';
import 'package:wonwoo/features/authentication/models/user_model.dart';
import 'package:wonwoo/features/authentication/screens/signup/verify_email.dart';
import 'package:wonwoo/utils/constants/image_string.dart';
import 'package:wonwoo/utils/helpers/network_manager.dart';
import 'package:wonwoo/utils/popups/full_screen_loader.dart';
import 'package:wonwoo/utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// Sign up
  void signup() async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDialog(
          'Загружаем информацию...', TImages.docerAnimation);

      //check connect with internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //register user
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //save user
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // remove loader
      TFullScreenLoader.stopLoading();

      // success message
      TLoaders.successSnackBar(
          title: 'Поздравляем!',
          message: 'Ваш аккаунт успешно зарегистрирован!');

      // redirect to Verify Email
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // remove loader
      TFullScreenLoader.stopLoading();
      //show errors
      TLoaders.errorSnackBar(title: 'Ошибка!', message: e.toString());
    }
  }
}
