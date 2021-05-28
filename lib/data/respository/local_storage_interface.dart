import 'package:ghost12/domain/repository/local_storages_repository_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _prefe_id = 'ID';
const _prefe_phone = 'PHONE';
const _prefe_token = 'TOKEN';
const _prefe_theme = 'THEME_DART';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  @override
  Future<String?> getId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_prefe_id);
  }

  @override
  Future<int?> getPhone() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(_prefe_phone);
  }

  @override
  Future<bool?> getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(_prefe_theme);
  }

  @override
  Future<String?> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_prefe_token);
  }

  @override
  Future<void> setId(String id) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_prefe_id, id);
  }

  @override
  Future<void> setPhone(int phone) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(_prefe_phone, phone);
  }

  @override
  Future<void> setTheme(bool theme) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(_prefe_theme, theme);
  }

  @override
  Future<void> setToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_prefe_token, token);
  }

  @override
  Future<void> removeLocal() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
