import 'package:flutter/cupertino.dart';
import 'package:ghost12/domain/exeptions/auth_exeption.dart';
import 'package:ghost12/domain/repository/user_repository_interface.dart';

enum LoginVerifyState {
  loading,
  initial,
}

class VerifyCreateUserBlock extends ChangeNotifier {
  late final UserRepository userRepository;

  VerifyCreateUserBlock({
    required this.userRepository,
  });

  final phoneController = TextEditingController();
  var loginVerifyState = LoginVerifyState.initial;

  Future<bool> validatePhone() async {
    final phone = int.parse(phoneController.text);
    print(phone.toString());
    try {
      loginVerifyState = LoginVerifyState.loading;
      notifyListeners();
      await userRepository.getUserByPhone(phone);
      loginVerifyState = LoginVerifyState.initial;
      notifyListeners();
      return true;
    } on AuthExeption catch (_) {
      loginVerifyState = LoginVerifyState.initial;
      notifyListeners();
      return false;
    }
  }
}
