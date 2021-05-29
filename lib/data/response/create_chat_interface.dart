import 'package:ghost12/data/request/message_request.dart';
import 'package:ghost12/data/response/user_response.dart';
import "package:json_annotation/json_annotation.dart";

part 'create_chat_interface.g.dart';

@JsonSerializable()
class CreateChatResponse {
  const CreateChatResponse({
    required this.chatsId,
    required this.type,
    required this.users,
    required this.messages,
    required this.id,
    required this.message,
  });

  final String chatsId;
  final bool type;
  final List<UserResponse> users;
  final List messages;
  final String id;
  final MessageRequest message;

  factory CreateChatResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateChatResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CreateChatResponseToJson(this);
}
