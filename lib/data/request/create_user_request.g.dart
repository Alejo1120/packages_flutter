// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserRequest _$CreateUserRequestFromJson(Map<String, dynamic> json) {
  return CreateUserRequest(
    name: json['name'] as String,
    description: json['description'] as String,
    phone: json['phone'] as int,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$CreateUserRequestToJson(CreateUserRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'phone': instance.phone,
      'password': instance.password,
    };
