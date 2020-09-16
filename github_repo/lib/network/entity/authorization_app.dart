import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AuthorizationApp {
  String name;
  String url;

  @JsonKey(name: 'client_id')
  String clientId;

  AuthorizationApp({this.name, this.url, this.clientId});

  factory AuthorizationApp.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationAppFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationAppToJson(this);
}

AuthorizationApp _$AuthorizationAppFromJson(Map<String, dynamic> json) {
  return AuthorizationApp(
      name: json['name'] as String,
      url: json['url'] as String,
      clientId: json['client_id'] as String);
}

Map<String, dynamic> _$AuthorizationAppToJson(AuthorizationApp instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'client_id': instance.clientId,
    };
