import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wonwoo/data/repositories/authentication/authentication_repository.dart';
import 'package:wonwoo/data/repositories/user/user_repository.dart';
import 'package:wonwoo/features/authentication/models/user_model.dart';
import 'package:wonwoo/features/authentication/screens/login/login.dart';
import 'package:wonwoo/features/personalization/screens/profile/widgets/re_authenticate_user_login_form.dart';
import 'package:wonwoo/utils/constants/image_string.dart';
import 'package:wonwoo/utils/constants/sizes.dart';
import 'package:wonwoo/utils/helpers/network_manager.dart';
import 'package:wonwoo/utils/popups/full_screen_loader.dart';
import 'package:wonwoo/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;

  final hidePassword = false.obs;
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = true;
    }
  }

  /// Save user Record from any Reg provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      //refresh user record
      await fetchUserRecord();

      //if no record already stored
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          /// Convert name to First and last name
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredentials.user!.displayName ?? '');

          //map data
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          //save data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Данные не сохранены!',
          message: 'Что-то пошло не так, пересохраните свои данные в профиле');
    }
  }

  // delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.md),
        title: 'Удалить аккаунт',
        middleText: 'Вы уверены что хотите удалить аккаунт?',
        confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.lg),
              child: Text('Удалить')),
        ),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('Отмена')));
  }

  // Delete user account
  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('В процессе', TImages.docerAnimation);

      //first re-auth user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        //re-verify email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Ошибка!', message: e.toString());
    }
  }

  // re-auth before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      TFullScreenLoader.openLoadingDialog('В процессе', TImages.docerAnimation);

      //check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // if(!ReAuthFormKey.currentState!.validate()){
      //   TFullScreenLoader.stopLoading();
      //   return;
      // }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Ошибка!', message: e.toString());
    }
  }

  //upload profile image
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        //upload image
        final imageUrl =
            await userRepository.uploadImage('Users/Images/Profile/', image);

        //update user image record
        Map<String, dynamic> json = {'ProfilePictire': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();

        TLoaders.successSnackBar(
            title: 'Поздравляем!',
            message: 'Ваше изображение профиля успешно обновлено!');
      }
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Ошибка', message: e);
    } finally{
      imageUploading.value = false;
    }
  }
}
