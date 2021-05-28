// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageRequest _$MessageRequestFromJson(Map<String, dynamic> json) {
  return MessageRequest(
    chat: json['chat'] as String,
    remited: json['remited'] as String,
    date: json['date'] as String,
    time: json['time'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$MessageRequestToJson(MessageRequest instance) =>
    <String, dynamic>{
      'chat': instance.chat,
      'remited': instance.remited,
      'date': instance.date,
      'time': instance.time,
      'message': instance.message,
    };
