import 'package:flutter/material.dart';
import 'package:ghost12/data/request/create_user_request.dart';
import 'package:ghost12/domain/exeptions/auth_exeption.dart';
import 'package:ghost12/domain/repository/local_storages_repository_interface.dart';
import 'package:ghost12/domain/repository/user_repository_interface.dart';

enum LoginState {
  loading,
  initial,
}

class CreateUserBlock extends ChangeNotifier {
  late final LocalStorageRepository localStorageRepository;
  late final UserRepository userRepository;
  late final int phone;
  late final String id;
  late final String token;

  CreateUserBlock({
    required this.localStorageRepository,
    required this.userRepository,
    required this.phone,
  });

  final nameController = TextEditingController();
  final contrasenaController = TextEditingController();
  final verifyContrasenaController = TextEditingController();
  var loginState = LoginState.initial;

  Future<bool> createUser() async {
    final name = nameController.text;
    final contrasena = contrasenaController.text;
    try {
      loginState = LoginState.loading;
      notifyListeners();
      final loginResponse = await userRepository.createUser(CreateUserRequest(
        name: name,
        description: 'Hello chat',
        phone: phone,
        password: contrasena,
      ));
      this.id = loginResponse.id;
      this.token = loginResponse.token;
      await localStorageRepository.setId(loginResponse.id);
      await localStorageRepository.setPhone(loginResponse.phone);
      await localStorageRepository.setToken(loginResponse.token);
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
