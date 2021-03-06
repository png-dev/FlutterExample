import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AuthorizationPost {
  static const CLIENT_ID = '95a15eab17ea6f4f0078';
  static const CLIENT_SECRET = '9229570e116ae15eca0c76ca40110b62625b41dd';
  static const APPLICATION_NAME = 'PNGRepos';
  static const CALLBACK_URL = 'https://github.com/png-dev/PNGRepos/callback';
  static const List<String> SCOPES = [
    'user',
    'repo',
    'gist',
    'notifications',
    'write:discussion',
    'user:follow'
  ];

  @JsonKey(name: 'client_id')
  String clientId;

  @JsonKey(name: 'client_secret')
  String clientSecret;

  String appName;
  String callback;
  List<String> scopes;

  AuthorizationPost(
      {this.clientId,
      this.clientSecret,
      this.appName,
      this.callback,
      this.scopes}) {
    this.clientId = CLIENT_ID;
    this.clientSecret = CLIENT_SECRET;
    this.appName = APPLICATION_NAME;
    this.callback = CALLBACK_URL;
    this.scopes = SCOPES;
  }

  factory AuthorizationPost.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationPostFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationPostToJson(this);
}

AuthorizationPost _$AuthorizationPostFromJson(Map<String, dynamic> json) {
  return AuthorizationPost(
    clientId: json['client_id'] as String,
    clientSecret: json['client_secret'] as String,
    appName: json['appName'] as String,
    callback: json['callback'] as String,
    scopes: (json['scopes'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$AuthorizationPostToJson(AuthorizationPost instance) =>
    <String, dynamic>{
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
      'appName': instance.appName,
      'callback': instance.callback,
      'scopes': instance.scopes,
    };
