import 'package:get/get.dart';
import 'package:firstbank_cib/utils/routes/routes_name.dart';

import 'package:firstbank_cib/view/home_screen.dart';
import 'package:firstbank_cib/view/login/login_screen.dart';
import 'package:firstbank_cib/view/splash_screen.dart';
import 'package:firstbank_cib/view/transfers/transfers_screen.dart';

import '../../bindings/bindings.dart';
import '../../view/dashboard/dashboard.dart';
import '../../view/login/pin_confirmation_screen.dart';
import '../../view/login/sign_in_screen.dart';

class Routes {
  static List<GetPage<dynamic>>? getPages = [
    GetPage<dynamic>(
      name: RoutesName.splash,
      page: () => const SplashScreen(),
      binding: SplashBindings(),
    ),
    GetPage<dynamic>(
      name: RoutesName.login,
      page: () => const Logincreen(),
      binding: AuthBindings(),
    ),
    GetPage<dynamic>(
      name: RoutesName.signIn,
      page: () => const SignInScreen(),
      binding: AuthBindings(),
    ),
    GetPage<dynamic>(
      name: RoutesName.pinConfirmation,
      page: () => const PinConfirmationScreen(),
      binding: AuthBindings(),
    ),
    GetPage<dynamic>(
      name: RoutesName.homeScreen,
      page: () => const HomeScreen(),
      binding: HomeBindings(),
    ),
    GetPage<dynamic>(
      name: RoutesName.dashBoard,
      page: () => const DashBoardScreen(),
      binding: HomeBindings(),
    ),
    GetPage<dynamic>(
      name: RoutesName.actionCenter,
      page: () => const ActionCenterScreen(),
      binding: HomeBindings(),
    ),
    GetPage<dynamic>(
      name: RoutesName.transactionDetails,
      page: () => const TransactionDetailsScreen(),
      binding: HomeBindings(),
    ),
    GetPage<dynamic>(
      name: RoutesName.transferScreen,
      page: () => const TransfersScreen(),
      binding: HomeBindings(),
    ),
  ];
}
