import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class EventCreatePayload {
  String ref;
  @JsonKey(name: 'ref_type')
  String refType;
  String masterBranch;
  String description;
  @JsonKey(name: 'pusher_type')
  String pusherType;

  EventCreatePayload(
      {this.ref,
      this.refType,
      this.masterBranch,
      this.description,
      this.pusherType});

  factory EventCreatePayload.fromJson(Map<String, dynamic> json) =>
      _$EventCreatePayloadFromJson(json);

  Map<String, dynamic> toJson() => _$EventCreatePayloadToJson(this);

  @override
  String toString() {
    return '{ref: $ref, refType: $refType, masterBranch: $masterBranch, description: $description, pusherType: $pusherType}';
  }
}

EventCreatePayload _$EventCreatePayloadFromJson(Map<String, dynamic> json) {
  return EventCreatePayload(
    ref: json['ref'] as String,
    refType: json['ref_type'] as String,
    masterBranch: json['masterBranch'] as String,
    description: json['description'] as String,
    pusherType: json['pusher_type'] as String,
  );
}

Map<String, dynamic> _$EventCreatePayloadToJson(EventCreatePayload instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'ref_type': instance.refType,
      'masterBranch': instance.masterBranch,
      'description': instance.description,
      'pusher_type': instance.pusherType,
    };
