import 'package:json_annotation/json_annotation.dart';

import 'issue_entity.dart';

@JsonSerializable()
class EventIssuesPayload {
  static final actionOpened = 'opened';
  static final actionEdited = 'edited';
  static final actionDeleted = 'deleted';
  static final actionTransferred = 'transferred';
  static final actionPinned = 'pinned';
  static final actionUnpinned = 'unpinned';
  static final actionClosed = 'closed';
  static final actionReopened = 'reopened';
  static final actionAssigned = 'assigned';
  static final actionUnassigned = 'unassigned';
  static final actionLabeled = 'labeled';
  static final actionUnlabeled = 'unlabeled';
  static final actionLocked = 'locked';
  static final actionUnlocked = 'unlocked';
  static final actionMilestoned = 'milestoned';
  static final actionDemilestoned = 'demilestoned';

  String action;
  IssueEntity issue;

  EventIssuesPayload({this.action, this.issue});

  factory EventIssuesPayload.fromJson(Map<String, dynamic> json) =>
      _$EventIssuesPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$EventIssuesPayloadToJson(this);

  @override
  String toString() {
    return '{action: $action, issue: $issue}';
  }
}

EventIssuesPayload _$EventIssuesPayloadFromJson(Map<String, dynamic> json) {
  return EventIssuesPayload(
    action: json['action'] as String,
    issue: json['issue'] == null
        ? null
        : IssueEntity.fromJson(json['issue'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EventIssuesPayloadToJson(EventIssuesPayload instance) =>
    <String, dynamic>{
      'action': instance.action,
      'issue': instance.issue,
    };
