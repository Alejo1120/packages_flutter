import 'package:ghost12/data/request/message_request.dart';
import 'package:ghost12/data/response/message_response.dart';

abstract class MessageRepository {
  Future<MessageResponse> createMessage(MessageRequest message, String token);
  Future<void> deleteMessage(String id, String token);
}
