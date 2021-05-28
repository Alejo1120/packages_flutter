import 'package:ghost12/data/response/chat_response.dart';
import 'package:ghost12/data/services/chats_service.dart';
import 'package:ghost12/domain/exeptions/auth_exeption.dart';
import 'package:ghost12/domain/repository/chats_repository_interface.dart';

class ChatsRepositoryImpl extends ChatsRepository {
  ChatsService chatsService = new ChatsService();

  @override
  Future<List<ChatResponse>> getChats(String id, String token) async {
    List<ChatResponse> listChats;
    try {
      listChats = await chatsService.getChats(id, token);
      return listChats;
    } on AuthExeption catch (_) {
      throw AuthExeption();
    }
  }
}
