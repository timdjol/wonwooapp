import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wonwoo/bindings/general_bindings.dart';
import 'package:wonwoo/features/authentication/screens/onboarding/onboarding.dart';
import 'package:wonwoo/routes/app_routes.dart';
import 'package:wonwoo/utils/theme/theme.dart';

class WonwooApp extends StatelessWidget {
  const WonwooApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.light,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      home: const OnBoardingScreen(),
    );
  }
}
