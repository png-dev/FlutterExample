import 'package:json_annotation/json_annotation.dart';

import 'event_actor.dart';
import 'event_repo.dart';

@JsonSerializable()
class EventEntity {
  String id;
  String type;
  EventActor actor;
  EventRepo repo;
  bool public;
  @JsonKey(name: 'created_at')
  String createdAt;
  dynamic payload;

  EventEntity(
      {this.id,
      this.type,
      this.actor,
      this.repo,
      this.public,
      this.createdAt,
      this.payload});

  factory EventEntity.fromJson(Map<String, dynamic> json) =>
      _$EventEntityFromJson(json);

  Map<String, dynamic> toJson() => _$EventEntityToJson(this);

  @override
  String toString() {
    return '{id: $id, type: $type, actor: $actor, repo: $repo, public: $public, createdAt: $createdAt, payload: $payload}';
  }
}

EventEntity _$EventEntityFromJson(Map<String, dynamic> json) {
  return EventEntity(
    id: json['id'] as String,
    type: json['type'] as String,
    actor: json['actor'] == null
        ? null
        : EventActor.fromJson(json['actor'] as Map<String, dynamic>),
    repo: json['repo'] == null
        ? null
        : EventRepo.fromJson(json['repo'] as Map<String, dynamic>),
    public: json['public'] as bool,
    createdAt: json['created_at'] as String,
    payload: json['payload'],
  );
}

Map<String, dynamic> _$EventEntityToJson(EventEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'actor': instance.actor,
      'repo': instance.repo,
      'public': instance.public,
      'created_at': instance.createdAt,
      'payload': instance.payload,
    };
