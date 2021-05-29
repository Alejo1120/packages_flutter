// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
    name: json['name'] as String,
    description: json['description'] as String,
    phone: json['phone'] as int,
    status: json['status'] as bool,
    chats: json['chats'] as String,
    id: json['id'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'phone': instance.phone,
      'status': instance.status,
      'chats': instance.chats,
      'id': instance.id,
      'token': instance.token,
    };
