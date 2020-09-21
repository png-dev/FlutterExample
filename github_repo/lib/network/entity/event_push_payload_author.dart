import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class EventPushPayloadAuthor {
  String email;
  String name;

  EventPushPayloadAuthor({this.email, this.name});

  factory EventPushPayloadAuthor.fromJson(Map<String, dynamic> json) =>
      _$EventPushPayloadAuthorFromJson(json);

  Map<String, dynamic> toJson() => _$EventPushPayloadAuthorToJson(this);

  @override
  String toString() {
    return '{email: $email, name: $name}';
  }
}

EventPushPayloadAuthor _$EventPushPayloadAuthorFromJson(
    Map<String, dynamic> json) {
  return EventPushPayloadAuthor(
    email: json['email'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$EventPushPayloadAuthorToJson(
        EventPushPayloadAuthor instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
    };
