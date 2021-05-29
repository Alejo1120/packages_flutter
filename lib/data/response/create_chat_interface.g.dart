// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_chat_interface.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateChatResponse _$CreateChatResponseFromJson(Map<String, dynamic> json) {
  return CreateChatResponse(
    chatsId: json['chatsId'] as String,
    type: json['type'] as bool,
    users: (json['users'] as List<dynamic>)
        .map((e) => UserResponse.fromJson(e as Map<String, dynamic>))
        .toList(),
    messages: json['messages'] as List<dynamic>,
    id: json['id'] as String,
    message: MessageRequest.fromJson(json['message'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateChatResponseToJson(CreateChatResponse instance) =>
    <String, dynamic>{
      'chatsId': instance.chatsId,
      'type': instance.type,
      'users': instance.users,
      'messages': instance.messages,
      'id': instance.id,
      'message': instance.message,
    };
