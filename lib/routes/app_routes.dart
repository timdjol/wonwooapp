import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:wonwoo/features/authentication/screens/login/login.dart';
import 'package:wonwoo/features/authentication/screens/onboarding/onboarding.dart';
import 'package:wonwoo/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:wonwoo/features/authentication/screens/signup/signup.dart';
import 'package:wonwoo/features/authentication/screens/signup/verify_email.dart';
import 'package:wonwoo/features/shop/screens/home/home.dart';
import 'package:wonwoo/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:wonwoo/routes/routes.dart';
import '../features/shop/screens/cart/cart.dart';

class AppRoutes{
  static final pages = [
    GetPage(name:TRoutes.home, page: () => const HomeScreen()),
    //GetPage(name:TRoutes.store, page: () => const StoreScreen()),
    //GetPage(name:TRoutes.favourites, page: () => const FavoriteScreen()),
    //GetPage(name:TRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name:TRoutes.productReviews, page: () => const ProductReviewsScreen()),
    //GetPage(name:TRoutes.order, page: () => const OrderScreen()),
    //GetPage(name:TRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name:TRoutes.cart, page: () => const CartScreen()),
    //GetPage(name:TRoutes.userProfile, page: () => const ProfileScreen()),
    //GetPage(name:TRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name:TRoutes.signup, page: () => const SignupScreen()),
    GetPage(name:TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name:TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name:TRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name:TRoutes.onBoarding, page: () => const OnBoardingScreen()),

  ];

}
