// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_chat_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateChatResquest _$CreateChatResquestFromJson(Map<String, dynamic> json) {
  return CreateChatResquest(
    chatsId: json['chatsId'] as String,
    type: json['type'] as bool,
    users: (json['users'] as List<dynamic>).map((e) => e as String).toList(),
    message:
        CreateMessageRequest.fromJson(json['message'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateChatResquestToJson(CreateChatResquest instance) =>
    <String, dynamic>{
      'chatsId': instance.chatsId,
      'type': instance.type,
      'users': instance.users,
      'message': instance.message,
    };
