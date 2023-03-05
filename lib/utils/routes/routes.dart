import 'package:firstbank_cib/utils/routes/routes_name.dart';
import 'package:firstbank_cib/view/login_screen.dart';
import 'package:firstbank_cib/view/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case RoutesName.login:
        return MaterialPageRoute(builder: (_) => Logincreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
