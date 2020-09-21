import 'package:json_annotation/json_annotation.dart';

import 'pull_request_entity.dart';

@JsonSerializable()
class EventPullRequestPayload {
  String action;
  int number;
  @JsonKey(name: 'pull_request')
  PullRequestEntity pullRequest;

  EventPullRequestPayload({this.action, this.number, this.pullRequest});

  factory EventPullRequestPayload.fromJson(Map<String, dynamic> json) =>
      _$EventPullRequestPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$EventPullRequestPayloadToJson(this);

  @override
  String toString() {
    return '{action: $action, number: $number, pullRequest: $pullRequest}';
  }
}

EventPullRequestPayload _$EventPullRequestPayloadFromJson(
    Map<String, dynamic> json) {
  return EventPullRequestPayload(
    action: json['action'] as String,
    number: json['number'] as int,
    pullRequest: json['pull_request'] == null
        ? null
        : PullRequestEntity.fromJson(
            json['pull_request'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EventPullRequestPayloadToJson(
        EventPullRequestPayload instance) =>
    <String, dynamic>{
      'action': instance.action,
      'number': instance.number,
      'pull_request': instance.pullRequest,
    };
