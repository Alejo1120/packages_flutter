import 'package:flutter/material.dart';
import 'package:ghost12/data/response/chat_response.dart';
import 'package:ghost12/domain/exeptions/auth_exeption.dart';
import 'package:ghost12/domain/repository/chats_repository_interface.dart';
import 'package:ghost12/domain/repository/local_storages_repository_interface.dart';
import 'package:ghost12/domain/repository/user_repository_interface.dart';

class HomeBlock extends ChangeNotifier {
  late final LocalStorageRepository localStorageRepository;
  late final UserRepository userRepository;
  late final ChatsRepository chatsRepository;
  late String name = "myUser";
  late int phone = 22;
  late List<ChatResponse> chats = [];

  HomeBlock({
    required this.userRepository,
    required this.localStorageRepository,
    required this.chatsRepository,
  });

  Future<bool?> initChats() async {
    final List<ChatResponse> listChats;
    final String? id = await localStorageRepository.getId();
    final String? token = await localStorageRepository.getToken();
    try {
      if (id != '' && id != null && token != '' && token != null) {
        final user = await userRepository.getUserById(id, token);
        print(user.name);
        this.name = user.name;
        this.phone = user.phone;
        listChats = await chatsRepository.getChats(user.chats, token);
        if (listChats.length > 0) {
          this.chats = listChats;
        } else {
          this.chats = [];
        }
        notifyListeners();
        return true;
      } else {
        notifyListeners();
        return false;
      }
    } on AuthExeption catch (_) {
      notifyListeners();
      return false;
    }
  }
}
