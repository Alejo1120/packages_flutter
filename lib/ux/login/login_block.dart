import 'package:flutter/material.dart';
import 'package:ghost12/data/request/login_request.dart';
import 'package:ghost12/domain/exeptions/auth_exeption.dart';
import 'package:ghost12/domain/repository/local_storages_repository_interface.dart';
import 'package:ghost12/domain/repository/user_repository_interface.dart';

enum LoginState {
  loading,
  initial,
}

class LoginBlock extends ChangeNotifier {
  late final LocalStorageRepository localStorageRepository;
  late final UserRepository userRepository;
  late final String id;
  late final String token;
  LoginBlock({
    required this.localStorageRepository,
    required this.userRepository,
  });

  final phoneController = TextEditingController();
  final contrasenaController = TextEditingController();
  var loginState = LoginState.initial;

  Future<bool?> login() async {
    final phone = int.parse(phoneController.text);
    final password = contrasenaController.text;
    final login = new LoginRequest(phone: phone, password: password);
    try {
      loginState = LoginState.loading;
      notifyListeners();
      final loginResponse = await userRepository.login(login);
      this.id = loginResponse.id;
      this.token = loginResponse.token;
      localStorageRepository.setId(loginResponse.id);
      localStorageRepository.setPhone(loginResponse.phone);
      localStorageRepository.setToken(loginResponse.token);
      loginState = LoginState.initial;
      notifyListeners();
      return true;
    } on AuthExeption catch (_) {
      loginState = LoginState.initial;
      notifyListeners();
      return false;
    }
  }
}
