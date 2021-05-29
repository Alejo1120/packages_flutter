import 'package:ghost12/data/request/create_message_request.dart';
import 'package:ghost12/data/request/message_request.dart';
import 'package:ghost12/data/response/user_response.dart';
import "package:json_annotation/json_annotation.dart";

part 'create_chat_request.g.dart';

@JsonSerializable()
class CreateChatResquest {
  const CreateChatResquest({
    required this.chatsId,
    required this.type,
    required this.users,
    required this.message,
  });

  final String chatsId;
  final bool type;
  final List<String> users;
  final CreateMessageRequest message;

  factory CreateChatResquest.fromJson(Map<String, dynamic> json) =>
      _$CreateChatResquestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateChatResquestToJson(this);
}
