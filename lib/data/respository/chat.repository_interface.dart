import 'package:ghost12/data/request/chat_request.dart';
import 'package:ghost12/data/response/chat_response.dart';
import 'package:ghost12/data/services/chat_service.dart';
import 'package:ghost12/domain/exeptions/auth_exeption.dart';
import 'package:ghost12/domain/repository/chat_repository_interface.dart';

class ChatRepositoryImpl extends ChatRepository {
  ChatService _chatService = new ChatService();
  @override
  Future<void> deleteChat(String id) async {
    try {} on AuthExeption catch (_) {
      AuthExeption();
    }
  }

  @override
  Future<ChatResponse> createChat(ChatRequest chat, String token) async {
    ChatResponse chatResponse;
    try {
      chatResponse = await _chatService.createChat(chat, token);
      return chatResponse;
    } on AuthExeption catch (_) {
      throw AuthExeption();
    }
  }

  @override
  Future<ChatResponse> getChat(String id, String token) async {
    ChatResponse chat;
    try {
      chat = await _chatService.getChat(id, token);
      return chat;
    } on AuthExeption catch (_) {
      throw AuthExeption();
    }
  }
}
