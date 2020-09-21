import 'package:json_annotation/json_annotation.dart';

import 'event_push_payload_author.dart';

@JsonSerializable()
class EventPushPayloadCommit {
  String sha;
  String message;
  bool distinct;
  String url;
  EventPushPayloadAuthor author;

  EventPushPayloadCommit(
      {this.sha, this.message, this.distinct, this.url, this.author});

  factory EventPushPayloadCommit.fromJson(Map<String, dynamic> json) =>
      _$EventPushPayloadCommitFromJson(json);

  Map<String, dynamic> toJson() => _$EventPushPayloadCommitToJson(this);

  @override
  String toString() {
    return '{sha: $sha, message: $message, distinct: $distinct, url: $url, author: $author}';
  }
}

EventPushPayloadCommit _$EventPushPayloadCommitFromJson(
    Map<String, dynamic> json) {
  return EventPushPayloadCommit(
    sha: json['sha'] as String,
    message: json['message'] as String,
    distinct: json['distinct'] as bool,
    url: json['url'] as String,
    author: json['author'] == null
        ? null
        : EventPushPayloadAuthor.fromJson(
            json['author'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EventPushPayloadCommitToJson(
        EventPushPayloadCommit instance) =>
    <String, dynamic>{
      'sha': instance.sha,
      'message': instance.message,
      'distinct': instance.distinct,
      'url': instance.url,
      'author': instance.author,
    };
