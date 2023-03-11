import 'package:firstbank_cib/utils/routes/routes_name.dart';
import 'package:get/get.dart';

import '../model/model.dart';
import '../services/services.dart';

class ActionCenterViewModel extends GetxController with CacheManager {
  Paymentservices paymentservices = Paymentservices();

  // local payment servie call
  final Rx<SinglePaymentResponse> _localPaymentResponse =
      SinglePaymentResponse().obs;
  SinglePaymentResponse get localPaymentResponse => _localPaymentResponse.value;

  @override
  void onInit() async {
    loadSinglePaymentResp();
    super.onInit();
  }

  loadSinglePaymentResp() async {
    SinglePaymentResponse paymentRes =
        await paymentservices.getSinglePaymentResp(
      session: "${getSession()}",
      username: "${getFullname()}@${getCorporateCode()}",
      subsidiaryId: 2,
      reportPage: false,
    );

    if (paymentRes.success == true) {
      _localPaymentResponse.value = paymentRes;
    } else {
      print("error");
      Get.snackbar(
        "Error",
        paymentRes.responseMessage.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  //navigation logics
  navigateback() {
    Get.back();
  }

  void navigateTotransactionDetails() {
    Get.toNamed(RoutesName.transactionDetails);
  }
}
