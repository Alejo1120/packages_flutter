// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatRequest _$ChatRequestFromJson(Map<String, dynamic> json) {
  return ChatRequest(
    chatId: json['chatId'] as String,
    type: json['type'] as bool,
    users: json['users'] as List<dynamic>,
  );
}

Map<String, dynamic> _$ChatRequestToJson(ChatRequest instance) =>
    <String, dynamic>{
      'chatId': instance.chatId,
      'type': instance.type,
      'users': instance.users,
    };
