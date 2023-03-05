import 'package:firstbank_cib/utils/routes/routes_name.dart';
import 'package:firstbank_cib/view/login/login_screen.dart';
import 'package:firstbank_cib/view/splash_screen.dart';
import 'package:get/get.dart';

import '../../view/login/sign_in_screen.dart';
import '../../view_model/sign_in_view_model.dart';

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
    GetPage<dynamic>(
      name: RoutesName.signIn,
      page: () => const SignInScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => SignInViewModel());
      }),
    ),
  ];
}
