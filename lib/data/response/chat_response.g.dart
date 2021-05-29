// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatResponse _$ChatResponseFromJson(Map<String, dynamic> json) {
  return ChatResponse(
    chatsId: json['chatsId'] as String,
    type: json['type'] as bool,
    users: (json['users'] as List<dynamic>)
        .map((e) => UserResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    messages: (json['messages'] as List<dynamic>)
        .map((e) => MessageResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$ChatResponseToJson(ChatResponse instance) =>
    <String, dynamic>{
      'chatsId': instance.chatsId,
      'type': instance.type,
      'users': instance.users,
      'messages': instance.messages,
      'id': instance.id,
    };
