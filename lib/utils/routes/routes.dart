import 'package:firstbank_cib/utils/routes/routes_name.dart';
import 'package:firstbank_cib/view/login_screen.dart';
import 'package:firstbank_cib/view/splash_screen.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage<dynamic>>? getPages = [
    GetPage<dynamic>(
      name: RoutesName.splash,
      page: () => const SplashScreen(),
    ),
    GetPage<dynamic>(
      name: RoutesName.login,
      page: () => const Logincreen(),
    ),
  ];
}
