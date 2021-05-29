// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return UserResponse(
    name: json['name'] as String,
    description: json['description'] as String,
    phone: json['phone'] as int,
    status: json['status'] as bool,
    chats: json['chats'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'phone': instance.phone,
      'status': instance.status,
      'chats': instance.chats,
      'id': instance.id,
    };
