import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final String name;
  final String description;
  final int phone;
  final bool status;
  final String chats;
  final String id;
  final String token;

  const LoginResponse({
    required this.name,
    required this.description,
    required this.phone,
    required this.status,
    required this.chats,
    required this.id,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
