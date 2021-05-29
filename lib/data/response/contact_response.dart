import 'package:json_annotation/json_annotation.dart';

part 'contact_response.g.dart';

@JsonSerializable()
class ContactResponse {
  const ContactResponse({
    required this.name,
    required this.phone,
  });

  final String name;
  final int phone;

  factory ContactResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ContactResponseToJson(this);
}
