import 'package:json_annotation/json_annotation.dart';

part 'create_message_request.g.dart';

@JsonSerializable()
class CreateMessageRequest {
  const CreateMessageRequest({
    required this.remited,
    required this.date,
    required this.time,
    required this.message,
  });
  final String remited;
  final String date;
  final String time;
  final String message;

  factory CreateMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateMessageRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateMessageRequestToJson(this);
}
