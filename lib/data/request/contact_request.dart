import 'package:json_annotation/json_annotation.dart';

part 'contact_request.g.dart';

@JsonSerializable()
class ContactRequest {
  final String name;
  final int phone;

  const ContactRequest({
    required this.name,
    required this.phone,
  });

  factory ContactRequest.fromJson(Map<String, dynamic> json) =>
      _$ContactRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ContactRequestToJson(this);
}
