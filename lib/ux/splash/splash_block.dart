import 'package:flutter/material.dart';
import 'package:ghost12/domain/exeptions/auth_exeption.dart';
import 'package:ghost12/domain/repository/local_storages_repository_interface.dart';
import 'package:ghost12/domain/repository/user_repository_interface.dart';

class SplashBlock extends ChangeNotifier {
  late final LocalStorageRepository localStorageRepository;
  late final UserRepository userRepository;
  late final String? id;
  late final String? token;

  SplashBlock(
      {required this.localStorageRepository, required this.userRepository});

  Future<bool?> validateSesion() async {
    token = await this.localStorageRepository.getToken();
    final _id = await this.localStorageRepository.getId();
    if (token != null) {
      try {
        final user = await this.userRepository.getUserById(_id!, token!);
        this.id = user.chats;
        return true;
      } on AuthExeption catch (_) {
        await localStorageRepository.removeLocal();
        return false;
      }
    } else {
      return false;
    }
  }
}
