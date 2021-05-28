import 'package:ghost12/data/response/message_response.dart';
import 'package:ghost12/data/response/user_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_response.g.dart';

@JsonSerializable()
class ChatResponse {
  const ChatResponse({
    required this.chatsId,
    required this.type,
    required this.users,
    required this.messages,
    required this.id,
  });

  final String chatsId;
  final bool type;
  final List<UserResponse> users;
  final List<MessageResponse> messages;
  final String id;

  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ChatResponseToJson(this);
}
