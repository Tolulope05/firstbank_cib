import 'package:firstbank_cib/utils/routes/routes_name.dart';
import 'package:firstbank_cib/view/dashboard/dash_board_screen.dart';
import 'package:firstbank_cib/view/dashboard/transaction_details_screen.dart';
import 'package:firstbank_cib/view/home_screen.dart';
import 'package:firstbank_cib/view/login/login_screen.dart';
import 'package:firstbank_cib/view/splash_screen.dart';
import 'package:firstbank_cib/view_model/actioncenter_view_model.dart';
import 'package:firstbank_cib/view_model/dashboard_view_model.dart';
import 'package:firstbank_cib/view_model/home_view_model.dart';
import 'package:get/get.dart';

import '../../view/dashboard/action_center_screen.dart';
import '../../view/login/pin_confirmation_screen.dart';
import '../../view/login/sign_in_screen.dart';
import '../../view_model/pin_confirmation_model.dart';
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
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => SignInViewModel());
        },
      ),
    ),
    GetPage<dynamic>(
      name: RoutesName.pinConfirmation,
      page: () => const PinConfirmationScreen(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => PinConfirmationModel());
        },
      ),
    ),
    GetPage<dynamic>(
      name: RoutesName.homeScreen,
      page: () => const HomeScreen(),
      binding: BindingsBuilder(
        () {
          Get.lazyPut(() => HomeViewModel());
          Get.put(DashBoardviewModel());
        },
      ),
    ),
    GetPage<dynamic>(
      name: RoutesName.dashBoard,
      page: () => const DashBoardScreen(),
    ),
    GetPage<dynamic>(
      name: RoutesName.actionCenter,
      page: () => const ActionCenterScreen(),
      binding: BindingsBuilder(
        () {
          Get.put(ActionCenterModel());
        },
      ),
    ),
    GetPage<dynamic>(
      name: RoutesName.transactionDetails,
      page: () => const TransactionDetailsScreen(),
      // binding: BindingsBuilder(
      //   () {
      //     Get.put(ActionCenterModel());
      //   },
      // ),
    ),
  ];
}
