import 'package:json_annotation/json_annotation.dart';

import 'comment_entity.dart';
import 'issue_entity.dart';

@JsonSerializable()
class EventIssueCommentPayload {
  static final actionCreated = 'created';
  static final actionEdited = 'edited';
  static final actionDeleted = 'deleted';

  String action;
  IssueEntity issue;
  CommentEntity comment;

  EventIssueCommentPayload({this.action, this.issue, this.comment});

  factory EventIssueCommentPayload.fromJson(Map<String, dynamic> json) =>
      _$EventIssueCommentPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$EventIssueCommentPayloadToJson(this);

  @override
  String toString() {
    return '{action: $action, issue: $issue, comment: $comment}';
  }
}

EventIssueCommentPayload _$EventIssueCommentPayloadFromJson(
    Map<String, dynamic> json) {
  return EventIssueCommentPayload(
    action: json['action'] as String,
    issue: json['issue'] == null
        ? null
        : IssueEntity.fromJson(json['issue'] as Map<String, dynamic>),
    comment: json['comment'] == null
        ? null
        : CommentEntity.fromJson(json['comment'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EventIssueCommentPayloadToJson(
        EventIssueCommentPayload instance) =>
    <String, dynamic>{
      'action': instance.action,
      'issue': instance.issue,
      'comment': instance.comment,
    };
