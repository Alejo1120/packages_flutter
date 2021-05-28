import 'package:json_annotation/json_annotation.dart';

part 'create_user_request.g.dart';

@JsonSerializable()
class CreateUserRequest {
  final String name;
  final String description;
  final int phone;
  final String password;

  CreateUserRequest({
    required this.name,
    required this.description,
    required this.phone,
    required this.password,
  });

  factory CreateUserRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateUserRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateUserRequestToJson(this);
}
