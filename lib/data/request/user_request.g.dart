// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRequest _$UserRequestFromJson(Map<String, dynamic> json) {
  return UserRequest(
    name: json['name'] as String,
    description: json['description'] as String,
    phone: json['phone'] as int,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$UserRequestToJson(UserRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'phone': instance.phone,
      'password': instance.password,
    };
