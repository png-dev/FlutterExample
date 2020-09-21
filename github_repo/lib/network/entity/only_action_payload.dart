import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class OnlyActionPayload {
  String action;

  OnlyActionPayload(this.action);

  factory OnlyActionPayload.fromJson(Map<String, dynamic> json) =>
      _$OnlyActionPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$OnlyActionPayloadToJson(this);

  @override
  String toString() {
    return '{action: $action}';
  }
}

OnlyActionPayload _$OnlyActionPayloadFromJson(Map<String, dynamic> json) {
  return OnlyActionPayload(
    json['action'] as String,
  );
}

Map<String, dynamic> _$OnlyActionPayloadToJson(OnlyActionPayload instance) =>
    <String, dynamic>{
      'action': instance.action,
    };
