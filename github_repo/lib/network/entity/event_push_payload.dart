import 'package:json_annotation/json_annotation.dart';

import 'event_push_payload_commit.dart';

@JsonSerializable()
class EventPushPayload {
  @JsonKey(name: 'push_id')
  int pushId;
  int size;
  @JsonKey(name: 'distinct_size')
  int distinctSize;
  String ref;
  String head;
  String before;
  List<EventPushPayloadCommit> commits;

  EventPushPayload(
      {this.pushId,
      this.size,
      this.distinctSize,
      this.ref,
      this.head,
      this.before,
      this.commits});

  factory EventPushPayload.fromJson(Map<String, dynamic> json) =>
      _$EventPushPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$EventPushPayloadToJson(this);

  @override
  String toString() {
    return '{pushId: $pushId, size: $size, distinctSize: $distinctSize, ref: $ref, head: $head, before: $before, commits: $commits}';
  }
}

EventPushPayload _$EventPushPayloadFromJson(Map<String, dynamic> json) {
  return EventPushPayload(
    pushId: json['push_id'] as int,
    size: json['size'] as int,
    distinctSize: json['distinct_size'] as int,
    ref: json['ref'] as String,
    head: json['head'] as String,
    before: json['before'] as String,
    commits: (json['commits'] as List)
        ?.map((e) => e == null
            ? null
            : EventPushPayloadCommit.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$EventPushPayloadToJson(EventPushPayload instance) =>
    <String, dynamic>{
      'push_id': instance.pushId,
      'size': instance.size,
      'distinct_size': instance.distinctSize,
      'ref': instance.ref,
      'head': instance.head,
      'before': instance.before,
      'commits': instance.commits,
    };
