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
      endDate: "2023-03-10",
      startDate: "2023-03-01",
      keyword: "string",
      page: 1,
      parameter: "string",
      recordPerPage: 1,
      reportPage: false,
    );

    if (paymentRes.success == true) {
      _localPaymentResponse.value = paymentRes;
    } else {
      print("error");
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
