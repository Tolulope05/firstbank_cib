import 'package:get/get.dart';

import '../model/login_response.dart';
import '../services/cache/cache_manager.dart';
import '../services/subsidiaries_services.dart';

class ProfileViewModel extends GetxController with CacheManager {
  final SubidiairiesServices _subsidiariesServices = SubidiairiesServices();
  final Rx<GetSubsidiary> _subsidiaries = GetSubsidiary().obs;
  GetSubsidiary get subsidiaries => _subsidiaries.value;

  final RxInt _subsidiaryId = 2.obs;
  int get subsidiaryId => _subsidiaryId.value;

  fetchSubsidiaryId(int id) {
    _subsidiaryId.value = id;
    getSubsidiaryInfo();
  }

  @override
  void onInit() async {
    await getSubsidiaryInfo();
    super.onInit();
  }

  getSubsidiaryInfo() async {
    GetSubsidiary subsRes = await _subsidiariesServices.getSubsidiaries(
      session: getSession()!,
      username: "${getFullname()!}@${getCorporateCode()!}",
      subsidiaryId: subsidiaryId,
    );
    _subsidiaries.value = subsRes;
  }
}
