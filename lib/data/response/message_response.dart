import 'package:json_annotation/json_annotation.dart';

part 'message_response.g.dart';

@JsonSerializable()
class MessageResponse {
  const MessageResponse({
    required this.chat,
    required this.remited,
    required this.date,
    required this.time,
    required this.message,
    required this.id,
  });

  final String chat;
  final String remited;
  final String date;
  final String time;
  final String message;
  final String id;

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MessageResponseToJson(this);
}
