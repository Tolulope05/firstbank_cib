import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  Future<bool> saveSession(String? session) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.SESSION.toString(), session);
    return true;
  }

  Future<bool> saveFullname(String? username) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.USERNAME.toString(), username);
    return true;
  }

  Future<bool> saveCorporateCode(String? corporateCode) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.USERNAME.toString(), corporateCode);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.TOKEN.toString());
  }

  String? getSession() {
    final box = GetStorage();
    return box.read(CacheManagerKey.SESSION.toString());
  }

  String? getFullname() {
    final box = GetStorage();
    return box.read(CacheManagerKey.USERNAME.toString());
  }

  String? getCorporateCode() {
    final box = GetStorage();
    return box.read(CacheManagerKey.USERNAME.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.TOKEN.toString());
  }

  Future<void> removeSession() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.SESSION.toString());
  }

  Future<void> removeFullname() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.USERNAME.toString());
  }

  Future<void> removeCorporateCode() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.USERNAME.toString());
  }
}

enum CacheManagerKey { TOKEN, SESSION, USERNAME }
