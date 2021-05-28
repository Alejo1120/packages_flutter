import 'package:json_annotation/json_annotation.dart';

part 'create_user_response.g.dart';

@JsonSerializable()
class CreateUserResponse {
  final String name;
  final String description;
  final int phone;
  final bool status;
  final String chats;
  final String id;
  final String token;

  CreateUserResponse({
    required this.name,
    required this.description,
    required this.phone,
    required this.status,
    required this.chats,
    required this.id,
    required this.token,
  });

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CreateUserResponseToJson(this);
}
