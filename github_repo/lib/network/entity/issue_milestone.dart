import 'package:json_annotation/json_annotation.dart';

import 'user_entity.dart';

@JsonSerializable()
class IssueMilestone {
  String url;
  @JsonKey(name: 'html_url')
  String htmlUrl;
  @JsonKey(name: 'labels_url')
  String labelsUrl;
  int id;
  @JsonKey(name: 'node_id')
  String noteId;
  int number;
  String state;
  String title;
  String description;
  UserEntity creator;
  @JsonKey(name: 'open_issues')
  int openIssues;
  @JsonKey(name: 'closed_issues')
  int closedIssues;
  @JsonKey(name: 'created_at')
  String createdAt;
  @JsonKey(name: 'updated_at')
  String updatedAt;
  @JsonKey(name: 'closed_at')
  String closedAt;
  @JsonKey(name: 'due_on')
  String dueOn;

  IssueMilestone(
      {this.url,
      this.htmlUrl,
      this.labelsUrl,
      this.id,
      this.noteId,
      this.number,
      this.state,
      this.title,
      this.description,
      this.creator,
      this.openIssues,
      this.closedIssues,
      this.createdAt,
      this.updatedAt,
      this.closedAt,
      this.dueOn});

  factory IssueMilestone.fromJson(Map<String, dynamic> json) =>
      _$IssueMilestoneFromJson(json);

  Map<String, dynamic> toJson() => _$IssueMilestoneToJson(this);

  @override
  String toString() {
    return '{url: $url, htmlUrl: $htmlUrl, labelsUrl: $labelsUrl, id: $id, noteId: $noteId, number: $number, state: $state, title: $title, description: $description, creator: $creator, openIssues: $openIssues, closedIssues: $closedIssues, createdAt: $createdAt, updatedAt: $updatedAt, closedAt: $closedAt, dueOn: $dueOn}';
  }
}

IssueMilestone _$IssueMilestoneFromJson(Map<String, dynamic> json) {
  return IssueMilestone(
    url: json['url'] as String,
    htmlUrl: json['html_url'] as String,
    labelsUrl: json['labels_url'] as String,
    id: json['id'] as int,
    noteId: json['node_id'] as String,
    number: json['number'] as int,
    state: json['state'] as String,
    title: json['title'] as String,
    description: json['description'] as String,
    creator: json['creator'] == null
        ? null
        : UserEntity.fromJson(json['creator'] as Map<String, dynamic>),
    openIssues: json['open_issues'] as int,
    closedIssues: json['closed_issues'] as int,
    createdAt: json['created_at'] as String,
    updatedAt: json['updated_at'] as String,
    closedAt: json['closed_at'] as String,
    dueOn: json['due_on'] as String,
  );
}

Map<String, dynamic> _$IssueMilestoneToJson(IssueMilestone instance) =>
    <String, dynamic>{
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'labels_url': instance.labelsUrl,
      'id': instance.id,
      'node_id': instance.noteId,
      'number': instance.number,
      'state': instance.state,
      'title': instance.title,
      'description': instance.description,
      'creator': instance.creator,
      'open_issues': instance.openIssues,
      'closed_issues': instance.closedIssues,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'closed_at': instance.closedAt,
      'due_on': instance.dueOn,
    };
