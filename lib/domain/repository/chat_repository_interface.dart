import 'package:ghost12/data/request/chat_request.dart';
import 'package:ghost12/data/response/chat_response.dart';

abstract class ChatRepository {
  Future<ChatResponse> getChat(String id, String token);
  Future<ChatResponse> createChat(ChatRequest chat, String token);
  Future<void> deleteChat(String id);
}
