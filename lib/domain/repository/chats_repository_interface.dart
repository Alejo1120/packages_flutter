import 'package:ghost12/data/response/chat_response.dart';

abstract class ChatsRepository {
  Future<List<ChatResponse>> getChats(String id, String token);
}
