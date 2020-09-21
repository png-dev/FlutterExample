import 'package:json_annotation/json_annotation.dart';

import 'release_entity.dart';

@JsonSerializable()
class EventReleasePayload {
  String action;
  ReleaseEntity release;

  EventReleasePayload({this.action, this.release});

  factory EventReleasePayload.fromJson(Map<String, dynamic> json) =>
      _$EventReleasePayloadFromJson(json);

  Map<String, dynamic> toJson() => _$EventReleasePayloadToJson(this);

  @override
  String toString() {
    return '{action: $action, release: $release}';
  }
}

EventReleasePayload _$EventReleasePayloadFromJson(Map<String, dynamic> json) {
  return EventReleasePayload(
    action: json['action'] as String,
    release: json['release'] == null
        ? null
        : ReleaseEntity.fromJson(json['release'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EventReleasePayloadToJson(
        EventReleasePayload instance) =>
    <String, dynamic>{
      'action': instance.action,
      'release': instance.release,
    };
