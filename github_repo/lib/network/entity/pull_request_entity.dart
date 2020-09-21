import 'package:json_annotation/json_annotation.dart';

import 'user_entity.dart';

@JsonSerializable()
class PullRequestEntity {
  int id;
  int number;
  String state;
  bool locked;
  String title;
  String body;
  UserEntity user;

  PullRequestEntity(
      {this.id,
      this.number,
      this.state,
      this.locked,
      this.title,
      this.body,
      this.user});

  factory PullRequestEntity.fromJson(Map<String, dynamic> json) =>
      _$PullRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PullRequestEntityToJson(this);

  @override
  String toString() {
    return '{id: $id, number: $number, state: $state, locked: $locked, title: $title, body: $body, user: $user}';
  }
}

PullRequestEntity _$PullRequestEntityFromJson(Map<String, dynamic> json) {
  return PullRequestEntity(
    id: json['id'] as int,
    number: json['number'] as int,
    state: json['state'] as String,
    locked: json['locked'] as bool,
    title: json['title'] as String,
    body: json['body'] as String,
    user: json['user'] == null
        ? null
        : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PullRequestEntityToJson(PullRequestEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'state': instance.state,
      'locked': instance.locked,
      'title': instance.title,
      'body': instance.body,
      'user': instance.user,
    };
