import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  final String name;
  final String description;
  final int phone;
  final bool status;
  final String chats;
  final String id;

  UserResponse({
    required this.name,
    required this.description,
    required this.phone,
    required this.status,
    required this.chats,
    required this.id,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
