import 'package:firstbank_cib/constants/colors.dart';
import 'package:flutter/material.dart';

import '../view_model/splash_view_model.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashViewmodel splashServices = SplashViewmodel();
  @override
  void initState() {
    super.initState();

    splashServices.handleStartUpLogic(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: AppColors.primaryColor,
    ));
  }
}
