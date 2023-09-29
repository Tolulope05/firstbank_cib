import 'package:firstbank_cib/constants/colors.dart';
import 'package:firstbank_cib/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'bindings/bindings.dart';
import 'utils/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'First Bank',
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        fontFamily: "Inter",
        scaffoldBackgroundColor: AppColors.scaffoldBgColor,
      ),
      home: const SplashScreen(),
      initialBinding: SplashBindings(),
      getPages: Routes.getPages,
    );
  }
}
