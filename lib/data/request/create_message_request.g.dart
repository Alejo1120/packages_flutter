// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_message_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateMessageRequest _$CreateMessageRequestFromJson(Map<String, dynamic> json) {
  return CreateMessageRequest(
    remited: json['remited'] as String,
    date: json['date'] as String,
    time: json['time'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$CreateMessageRequestToJson(
        CreateMessageRequest instance) =>
    <String, dynamic>{
      'remited': instance.remited,
      'date': instance.date,
      'time': instance.time,
      'message': instance.message,
    };
