import 'package:get/get.dart';

import '../model/login_response.dart';
import '../services/cache/cache_manager.dart';
import '../services/subsidiaries_services.dart';

class ProfileViewModel extends GetxController with CacheManager {
  final SubidiairiesServices _subsidiariesServices = SubidiairiesServices();
  GetSubsidiary? subsidiaries;

  final RxInt _subsidiaryId = 2.obs;
  int get subsidiaryId => _subsidiaryId.value;

  @override
  void onInit() {
    getSubsidiaryInfo();
    super.onInit();
  }

  getSubsidiaryInfo() async {
    subsidiaries = await _subsidiariesServices.getSubsidiaries(
      session: getSession()!,
      username: "${getFullname()!}@${getCorporateCode()!}",
      subsidiaryId: subsidiaryId,
    );
  }
}
