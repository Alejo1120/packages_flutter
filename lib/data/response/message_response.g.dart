// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageResponse _$MessageResponseFromJson(Map<String, dynamic> json) {
  return MessageResponse(
    chat: json['chat'] as String,
    remited: json['remited'] as String,
    date: json['date'] as String,
    time: json['time'] as String,
    message: json['message'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$MessageResponseToJson(MessageResponse instance) =>
    <String, dynamic>{
      'chat': instance.chat,
      'remited': instance.remited,
      'date': instance.date,
      'time': instance.time,
      'message': instance.message,
      'id': instance.id,
    };
