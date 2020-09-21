import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class EventActor {
  int id;
  String login;
  @JsonKey(name: 'display_login')
  String displayLogin;
  @JsonKey(name: 'gravatar_id')
  String gravatarId;
  String url;
  @JsonKey(name: 'avatar_url')
  String avatarUrl;

  EventActor(
      {this.id,
      this.login,
      this.displayLogin,
      this.gravatarId,
      this.url,
      this.avatarUrl});

  factory EventActor.fromJson(Map<String, dynamic> json) =>
      _$EventActorFromJson(json);

  Map<String, dynamic> toJson() => _$EventActorToJson(this);

  @override
  String toString() {
    return '{id: $id, login: $login, displayLogin: $displayLogin, gravatarId: $gravatarId, url: $url, avatarUrl: $avatarUrl}';
  }
}

EventActor _$EventActorFromJson(Map<String, dynamic> json) {
  return EventActor(
    id: json['id'] as int,
    login: json['login'] as String,
    displayLogin: json['display_login'] as String,
    gravatarId: json['gravatar_id'] as String,
    url: json['url'] as String,
    avatarUrl: json['avatar_url'] as String,
  );
}

Map<String, dynamic> _$EventActorToJson(EventActor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'display_login': instance.displayLogin,
      'gravatar_id': instance.gravatarId,
      'url': instance.url,
      'avatar_url': instance.avatarUrl,
    };
