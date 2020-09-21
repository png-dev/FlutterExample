import 'package:json_annotation/json_annotation.dart';

import 'comment_entity.dart';
import 'pull_request_entity.dart';

@JsonSerializable()
class EventPullRequestReviewCommentPayload {
  String action;
  CommentEntity comment;
  @JsonKey(name: 'pull_request')
  PullRequestEntity pullRequest;

  EventPullRequestReviewCommentPayload(
      {this.action, this.comment, this.pullRequest});

  factory EventPullRequestReviewCommentPayload.fromJson(
          Map<String, dynamic> json) =>
      _$EventPullRequestReviewCommentPayloadFromJson(json);

  Map<String, dynamic> toJson() =>
      _$EventPullRequestReviewCommentPayloadToJson(this);

  @override
  String toString() {
    return '{action: $action, comment: $comment, pullRequest: $pullRequest}';
  }
}

EventPullRequestReviewCommentPayload
    _$EventPullRequestReviewCommentPayloadFromJson(Map<String, dynamic> json) {
  return EventPullRequestReviewCommentPayload(
    action: json['action'] as String,
    comment: json['comment'] == null
        ? null
        : CommentEntity.fromJson(json['comment'] as Map<String, dynamic>),
    pullRequest: json['pull_request'] == null
        ? null
        : PullRequestEntity.fromJson(
            json['pull_request'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EventPullRequestReviewCommentPayloadToJson(
        EventPullRequestReviewCommentPayload instance) =>
    <String, dynamic>{
      'action': instance.action,
      'comment': instance.comment,
      'pull_request': instance.pullRequest,
    };
