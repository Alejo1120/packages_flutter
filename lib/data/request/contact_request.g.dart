// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactRequest _$ContactRequestFromJson(Map<String, dynamic> json) {
  return ContactRequest(
    name: json['name'] as String,
    phone: json['phone'] as int,
  );
}

Map<String, dynamic> _$ContactRequestToJson(ContactRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
    };
