import 'package:json_annotation/json_annotation.dart';

import 'issue_label.dart';
import 'issue_milestone.dart';
import 'issue_pull_request.dart';
import 'repo_entity.dart';
import 'user_entity.dart';

@JsonSerializable()
class IssueEntity {
  int id;
  int number;
  int comments;
  bool locked;
  @JsonKey(name: 'node_id')
  String noteId;
  String title;
  String body;
  String state;
  UserEntity user;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'updated_at')
  String updatedAt;
  @JsonKey(name: 'closed_at')
  String closedAt;

  String url;
  @JsonKey(name: 'repository_url')
  String repositoryUrl;
  @JsonKey(name: 'labels_url')
  String labelsUrl;
  @JsonKey(name: 'comments_url')
  String commentsUrl;
  @JsonKey(name: 'events_url')
  String eventsUrl;
  @JsonKey(name: 'html_url')
  String htmlUrl;
  @JsonKey(name: 'active_lock_reason')
  String activeLockReason;
  List<IssueLabel> labels;
  UserEntity assignee;
  List<UserEntity> assignees;
  IssueMilestone milestone;
  @JsonKey(name: 'pull_request')
  IssuePullRequest pullRequest;
  RepoEntity repository;

  IssueEntity(
      {this.id,
      this.number,
      this.comments,
      this.locked,
      this.noteId,
      this.title,
      this.body,
      this.state,
      this.user,
      this.createdAt,
      this.updatedAt,
      this.closedAt,
      this.url,
      this.repositoryUrl,
      this.labelsUrl,
      this.commentsUrl,
      this.eventsUrl,
      this.htmlUrl,
      this.activeLockReason,
      this.labels,
      this.assignee,
      this.assignees,
      this.milestone,
      this.pullRequest,
      this.repository});

  factory IssueEntity.fromJson(Map<String, dynamic> json) =>
      _$IssueEntityFromJson(json);

  Map<String, dynamic> toJson() => _$IssueEntityToJson(this);

  @override
  String toString() {
    return '{id: $id, number: $number, comments: $comments, locked: $locked, noteId: $noteId, title: $title, body: $body, state: $state, user: $user, createdAt: $createdAt, updatedAt: $updatedAt, closedAt: $closedAt, url: $url, repositoryUrl: $repositoryUrl, labelsUrl: $labelsUrl, commentsUrl: $commentsUrl, eventsUrl: $eventsUrl, htmlUrl: $htmlUrl, activeLockReason: $activeLockReason, labels: $labels, assignee: $assignee, assignees: $assignees, milestone: $milestone, pullRequest: $pullRequest, repository: $repository}';
  }
}

IssueEntity _$IssueEntityFromJson(Map<String, dynamic> json) {
  return IssueEntity(
    id: json['id'] as int,
    number: json['number'] as int,
    comments: json['comments'] as int,
    locked: json['locked'] as bool,
    noteId: json['node_id'] as String,
    title: json['title'] as String,
    body: json['body'] as String,
    state: json['state'] as String,
    user: json['user'] == null
        ? null
        : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String,
    closedAt: json['closed_at'] as String,
    url: json['url'] as String,
    repositoryUrl: json['repository_url'] as String,
    labelsUrl: json['labels_url'] as String,
    commentsUrl: json['comments_url'] as String,
    eventsUrl: json['events_url'] as String,
    htmlUrl: json['html_url'] as String,
    activeLockReason: json['active_lock_reason'] as String,
    labels: (json['labels'] as List)
        ?.map((e) =>
            e == null ? null : IssueLabel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    assignee: json['assignee'] == null
        ? null
        : UserEntity.fromJson(json['assignee'] as Map<String, dynamic>),
    assignees: (json['assignees'] as List)
        ?.map((e) =>
            e == null ? null : UserEntity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    milestone: json['milestone'] == null
        ? null
        : IssueMilestone.fromJson(json['milestone'] as Map<String, dynamic>),
    pullRequest: json['pull_request'] == null
        ? null
        : IssuePullRequest.fromJson(
            json['pull_request'] as Map<String, dynamic>),
    repository: json['repository'] == null
        ? null
        : RepoEntity.fromJson(json['repository'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$IssueEntityToJson(IssueEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'comments': instance.comments,
      'locked': instance.locked,
      'node_id': instance.noteId,
      'title': instance.title,
      'body': instance.body,
      'state': instance.state,
      'user': instance.user,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'closed_at': instance.closedAt,
      'url': instance.url,
      'repository_url': instance.repositoryUrl,
      'labels_url': instance.labelsUrl,
      'comments_url': instance.commentsUrl,
      'events_url': instance.eventsUrl,
      'html_url': instance.htmlUrl,
      'active_lock_reason': instance.activeLockReason,
      'labels': instance.labels,
      'assignee': instance.assignee,
      'assignees': instance.assignees,
      'milestone': instance.milestone,
      'pull_request': instance.pullRequest,
      'repository': instance.repository,
    };
