import 'package:firstbank_cib/utils/routes/routes_name.dart';
import 'package:flutter/material.dart';

class SplashViewmodel {
  Future handleStartUpLogic(BuildContext context) async {
    var hasLoggedInUser = false;
    await Future.delayed(const Duration(seconds: 1));
    if (hasLoggedInUser == true) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, RoutesName.home);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, RoutesName.login);
    }
  }
}
