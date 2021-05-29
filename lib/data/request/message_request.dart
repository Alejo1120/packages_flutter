import 'package:json_annotation/json_annotation.dart';

part 'message_request.g.dart';

@JsonSerializable()
class MessageRequest {
  const MessageRequest({
    required this.chat,
    required this.remited,
    required this.date,
    required this.time,
    required this.message,
  });
  final String chat;
  final String remited;
  final String date;
  final String time;
  final String message;

  factory MessageRequest.fromJson(Map<String, dynamic> json) =>
      _$MessageRequestFromJson(json);
  Map<String, dynamic> toJson() => _$MessageRequestToJson(this);
}
