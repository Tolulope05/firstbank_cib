import 'package:firstbank_cib/bindings/initial_bindings.dart';
import 'package:firstbank_cib/constants/colors.dart';
import 'package:firstbank_cib/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'utils/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
      initialBinding: InitialBindings(),
      getPages: Routes.getPages,
    );
  }
}
