abstract class LocalStorageRepository {
  Future<int?> getPhone();
  Future<void> setPhone(int phone);
  Future<String?> getId();
  Future<void> setId(String id);
  Future<String?> getToken();
  Future<void> setToken(String token);
  Future<bool?> getTheme();
  Future<void> setTheme(bool theme);
  Future<void> removeLocal();
}
