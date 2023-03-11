import 'package:get/get.dart';

import '../model/login_response.dart';
import '../services/cache/cache_manager.dart';
import '../services/subsidiaries_services.dart';
import 'view_model.dart';

class ProfileViewModel extends GetxController with CacheManager {
  final SubidiairiesServices _subsidiariesServices = SubidiairiesServices();
  final Rx<GetSubsidiary> _subsidiaries = GetSubsidiary().obs;
  GetSubsidiary get subsidiaries => _subsidiaries.value;

  final RxInt _subsidiaryId = 2.obs;
  int get subsidiaryId => _subsidiaryId.value;

  // final List<GetSubsidiary> _subsidiariesList =
  //     Get.put(AuthViewModel()).subsidiariesList;
  // List<GetSubsidiary> get subsidiariesList => _subsidiariesList;

  Future<List<GetSubsidiary>> fetchSubsidiaries() async {
    final List<GetSubsidiary> subsidiariesList =
        Get.put(AuthViewModel()).subsidiariesList;
    return subsidiariesList;
  }

  fetchSubsidiaryId(int id) {
    _subsidiaryId.value = id;
    getSubsidiaryInfo();
    Get.back();
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
