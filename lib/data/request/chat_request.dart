import 'package:ghost12/data/response/user_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_request.g.dart';

@JsonSerializable()
class ChatRequest {
  const ChatRequest({
    required this.chatId,
    required this.type,
    required this.users,
  });

  final String chatId;
  final bool type;
  final List users;

  factory ChatRequest.fromJson(Map<String, dynamic> json) =>
      _$ChatRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ChatRequestToJson(this);
}
