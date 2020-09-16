import 'package:github_repo/network/entity/authorization_app.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AuthorizationEntity {
  AuthorizationApp app;

  @JsonKey(name: 'hashed_token')
  String hashedToken;
  dynamic note;

  @JsonKey(name: 'note_url')
  String noteUrl;

  @JsonKey(name: 'updated_at')
  String updatedAt;

  @JsonKey(name: 'token_last_eight')
  String tokenLastEight;

  dynamic fingerprint;

  @JsonKey(name: 'created_at')
  String createdAt;
  int id;
  List<String> scopes;
  String url;

  String token;

  AuthorizationEntity(
      {this.app,
      this.hashedToken,
      this.note,
      this.noteUrl,
      this.updatedAt,
      this.tokenLastEight,
      this.fingerprint,
      this.createdAt,
      this.id,
      this.scopes,
      this.url,
      this.token});

  factory AuthorizationEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationEntityToJson(this);
}

AuthorizationEntity _$AuthorizationEntityFromJson(Map<String, dynamic> json) {
  return AuthorizationEntity(
      app: json['app'] == null
          ? null
          : AuthorizationApp.fromJson(json['app'] as Map<String, dynamic>),
      hashedToken: json['hashed_token'] as String,
      note: json['note'],
      noteUrl: json['note_url'] as String,
      updatedAt: json['updated_at'] as String,
      tokenLastEight: json['token_last_eight'] as String,
      fingerprint: json['fingerprint'],
      createdAt: json['created_at'] as String,
      id: json['id'] as int,
      scopes: (json['scopes'] as List)?.map((e) => e as String)?.toList(),
      url: json['url'] as String,
      token: json['token'] as String);
}

Map<String, dynamic> _$AuthorizationEntityToJson(
        AuthorizationEntity instance) =>
    <String, dynamic>{
      'app': instance.app,
      'hashed_token': instance.hashedToken,
      'note': instance.note,
      'note_url': instance.noteUrl,
      'updated_at': instance.updatedAt,
      'token_last_eight': instance.tokenLastEight,
      'fingerprint': instance.fingerprint,
      'created_at': instance.createdAt,
      'id': instance.id,
      'scopes': instance.scopes,
      'url': instance.url,
      'token': instance.token
    };
