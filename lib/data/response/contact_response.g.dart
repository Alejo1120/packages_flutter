// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactResponse _$ContactResponseFromJson(Map<String, dynamic> json) {
  return ContactResponse(
    name: json['name'] as String,
    phone: json['phone'] as int,
  );
}

Map<String, dynamic> _$ContactResponseToJson(ContactResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
    };
