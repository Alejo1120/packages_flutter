import 'package:ghost12/data/response/message_response.dart';
import 'package:ghost12/data/request/message_request.dart';
import 'package:ghost12/data/services/message_service.dart';
import 'package:ghost12/domain/exeptions/auth_exeption.dart';
import 'package:ghost12/domain/repository/message_repository_interface.dart';

class MessageRepositoryImpl extends MessageRepository {
  MessageService _messageService = new MessageService();
  @override
  Future<void> deleteMessage(String id, String token) async {
    try {} on AuthExeption catch (_) {
      AuthExeption();
    } on AuthExeption catch (_) {
      throw AuthExeption();
    }
  }

  @override
  Future<MessageResponse> createMessage(
      MessageRequest message, String token) async {
    MessageResponse messageResponse;
    try {
      messageResponse = await _messageService.createMessage(message, token);
      return messageResponse;
    } on AuthExeption catch (_) {
      throw AuthExeption();
    }
  }
}
