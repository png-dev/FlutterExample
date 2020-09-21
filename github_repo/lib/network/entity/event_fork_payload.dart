import 'package:json_annotation/json_annotation.dart';

import 'forkee_entity.dart';

@JsonSerializable()
class EventForkPayload {
  ForkeeEntity forkee;

  EventForkPayload(this.forkee);

  factory EventForkPayload.fromJson(Map<String, dynamic> json) =>
      _$EventForkPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$EventForkPayloadToJson(this);

  @override
  String toString() {
    return '{frokee: $forkee}';
  }
}

EventForkPayload _$EventForkPayloadFromJson(Map<String, dynamic> json) {
  return EventForkPayload(
    json['forkee'] == null
        ? null
        : ForkeeEntity.fromJson(json['forkee'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EventForkPayloadToJson(EventForkPayload instance) =>
    <String, dynamic>{
      'forkee': instance.forkee,
    };
