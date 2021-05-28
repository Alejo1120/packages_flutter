import 'package:flutter/material.dart';
import 'package:ghost12/data/request/chat_request.dart';
import 'package:ghost12/data/request/message_request.dart';
import 'package:ghost12/data/response/chat_response.dart';
import 'package:ghost12/data/response/message_response.dart';
import 'package:ghost12/data/response/user_response.dart';
import 'package:ghost12/domain/exeptions/auth_exeption.dart';
import 'package:ghost12/domain/repository/chat_repository_interface.dart';
import 'package:ghost12/domain/repository/local_storages_repository_interface.dart';
import 'package:ghost12/domain/repository/message_repository_interface.dart';
import 'package:ghost12/domain/repository/user_repository_interface.dart';

class MessageBlock extends ChangeNotifier {
  late final LocalStorageRepository localStorageRepository;
  late final UserRepository userRepository;
  late final MessageRepository messageRepository;
  late final ChatRepository chatRepository;
  late final int phone;
  late String user = '';
  late ChatResponse chat;

  final messageController = TextEditingController();

  MessageBlock({
    required this.localStorageRepository,
    required this.userRepository,
    required this.chatRepository,
    required this.messageRepository,
  });

  Future<void> initChat(ChatResponse newChat) async {
    this.chat = newChat;
    final id = await localStorageRepository.getId();
    UserResponse userNew;

    if (id != null && id != '') {
      userNew = await userRepository.getUserById(id, "token");
      this.user = userNew.id;
    }
  }

  Future<void> addMessage() async {
    final message = messageController.text;
    MessageRequest messagerequest = MessageRequest(
        chat: chat.id,
        remited: chat.users[0].id,
        date: "12/12/12",
        time: "12:53",
        message: message);
    try {
      MessageResponse messageResponse =
          await messageRepository.createMessage(messagerequest, "token");
      this.chat.messages.add(messageResponse);
      notifyListeners();
    } on AuthExeption catch (_) {}
  }

  Future<void> createChat() async {
    ChatResponse chatResponse;
    final id = await localStorageRepository.getId();
    if (id != null && id != '') {
      final user = await userRepository.getUserById(id, "token");
      final userMessage = await userRepository.getUserByPhone(phone);
      ChatRequest chatRequest =
          ChatRequest(chatId: user.chats, type: false, users: [userMessage]);
      try {
        chatResponse = await chatRepository.createChat(chatRequest, "token");
        this.chat = chatResponse;
        notifyListeners();
      } on AuthExeption catch (_) {}
    }
  }
}
