import 'package:json_annotation/json_annotation.dart';

part 'user_request.g.dart';

@JsonSerializable()
class UserRequest {
  final String name;
  final String description;
  final int phone;
  final String password;

  const UserRequest({
    required this.name,
    required this.description,
    required this.phone,
    required this.password,
  });

  factory UserRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UserRequestToJson(this);
}
